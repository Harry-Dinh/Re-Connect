//
//  FollowingManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-07.
//

import Foundation
import SwiftUI
import FirebaseDatabase

class FollowingManager: ObservableObject {
    
    // MARK: - REFERENCES TO OTHER FRAMEWORKS
    
    public static let shared = FollowingManager()
    
    private let databaseRef = Database.database().reference()
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject private var registerVM = RegisterScreenVM.instance
    @ObservedObject private var notificationManager = NotificationManager.instance
    
    // MARK: - UPDATE FOLLOWING & FOLLOWER LISTS
    
    /// Add a user to the following list of the *current* user, as well as updating that list data on the database.
    /// - Parameter user: The user to add to the following list
    public func addUserToFollowingList(_ user: RECUser) {
        // Add the following user to the local followings array
        loginVM.currentUser?.followings.append(user.firebaseUID)
        loginVM.currentUser?.followingCount += 1
        
        // Get a reference to the current user? Not sure why I did this before, maybe to prevent some sort of Swift's optional unwrapping issue?
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        let otherUserJSONData: [String: Any] = [
            "\(user.firebaseUID)": user.firebaseUID
        ]
        databaseRef.child(RECDatabaseParentPath.users).child(currentUser.firebaseUID).child(RECUser.Property.followings).updateChildValues(otherUserJSONData)
        
        let updatedFollowingCount: [String: Any] = [
            "\(RECUser.Property.followingCount)": currentUser.followingCount
        ]
        databaseRef.child(RECDatabaseParentPath.users).child(currentUser.firebaseUID).updateChildValues(updatedFollowingCount)
    }
    
    
    /// Add the *current* user to the *other* user's followers list. This function only gets called if the *other* user's account is not locked.
    /// - Parameter user: The user to get a reference to the followers list to add the *current* user to.
    public func addCurrentUserToFollowerList(of user: RECUser) {
        // Get a reference to the current user
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        // Turn the user parameter into a variable (so it's mutable) then append that user's followers list
        // Not sure if this step is necessary since you can reload the view afterward...
        var otherUser = user
        otherUser.followers.append(currentUser.firebaseUID)
        otherUser.followerCount += 1
        
        // This JSON data stores both the current user Firebase UID as well as the updated follower count
        // This ensures that both data are updated in one go, which is more efficient than calling two update functions
        let currentUserJSONData: [String: Any] = [
            "\(currentUser.firebaseUID)": currentUser.firebaseUID
        ]
        databaseRef.child(RECDatabaseParentPath.users).child(otherUser.firebaseUID).child(RECUser.Property.followers).updateChildValues(currentUserJSONData)
        
        let updatedFollowerCount: [String: Any] = [
            "\(RECUser.Property.followerCount)": otherUser.followerCount
        ]
        databaseRef.child(RECDatabaseParentPath.users).child(otherUser.firebaseUID).updateChildValues(updatedFollowerCount)
    }
    
    
    // MARK: - FOLLOW & REQUEST FOLLOW ACTIONS
    
    
    /// A function that contains the actions that will occur when the *current* user taps the "Follow" button
    /// - Parameter otherUser: The user to follow (this is passed in so that the app knows where to update the data on the receiving end)
    public func follow(_ otherUser: RECUser) {
        // Get a reference to the current user
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        // Check if the currentUser has already followed the otherUser
        var alreadyFollowed = false
        for firUID in currentUser.followings {
            if firUID == otherUser.firebaseUID {
                alreadyFollowed = true
                break
            }
        }
        
        // Only run the following remaining block of code if the current user has not yet follow the other user
        if !alreadyFollowed {
            // Call the functions to add the OTHER user to the CURRENT user's followings list; and the function that adds the CURRENT user to the OTHER user's followers list
            addUserToFollowingList(otherUser)
            addCurrentUserToFollowerList(of: otherUser)
            
            // Create and send a notification to the OTHER user to inform them that they have a new follower
            let datePosted = notificationManager.globalDateFormatter.string(from: Date())
            let notification = RECNotification(title: "New Follower",
                                               notificationDescription: "\(currentUser.displayName) has started following you",
                                               iconURL: "",
                                               notificationType: RECNotificationTypes.newFollower,
                                               actions: [],
                                               datePosted: datePosted)
            notificationManager.send(notification, to: otherUser)
            return
        }
        // Update the SwiftUI button's state to show unfollow instead
    }
    
    
    /// Send a notification to the passed in user that have actions that allow them to accept/decline the following request
    /// - Parameter user: The user to send the follow request notification to.
    public func requestToFollow(_ user: RECUser) {
        // Get a reference to the current user
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        // Create a follower request notification
        var followRequestNotification = RECNotification(title: "New Follower Request",
                                                        notificationDescription: "\(currentUser.displayName) has requested to follow you",
                                                        iconURL: CUPSystemIcon.userRequestAction,
                                                        notificationType: RECNotificationTypes.followerRequest,
                                                        actions: [RECNotificationActions.respondFollowerRequest, RECNotificationActions.rejectFollowerRequest],
                                                        datePosted: DateFormatter().string(from: Date()))
        
        // Adding the current user (now other user) ID into the notification's attributes
        followRequestNotification.attributes = [
            "otherUserID": loginVM.currentUser?.firebaseUID ?? RECUser.placeholderUser.firebaseUID
        ]
        
        // Send the follower request notification to the other user
        notificationManager.send(followRequestNotification, to: user)
    }
    
    
    /// A function that sends a signal to the database that either accept or reject a following request. The decision is based on the `response` variable and the signal is sent to the user with the ID from `user`.
    /// - Parameters:
    ///   - otherUser: The user object whose ID will be used to send the signal to
    ///   - response: The response that will be used to decide what type of signal to send (accept or decline)
    public func respondToFollowRequest(otherUser: RECUser, response: RECNotificationResponse) {
        // Decide which type of response should be sent
        if response == .acceptFollowerRequest {
            // Send a response that accept the follower request
        } else {
            // Send a response that reject the follower request
            /*
             1. Send a notification to the other user telling them that the sender has declined their request
             2. Delete the old following request notification on the sender's end
             */
            
            // Create a notification and send it to the other user's notification feed
            // Note: In the future, find a way to convert a date object into String
            let declineNotification = RECNotification(title: "Follower Request Declined",
                                                      notificationDescription: "\(loginVM.currentUser?.displayName ?? RECUser.placeholderUser.displayName) has declined your follow request",
                                                      iconURL: CUPSystemIcon.userRequestAction,
                                                      notificationType: RECNotificationTypes.generic,
                                                      actions: [],
                                                      datePosted: DateFormatter().string(from: Date()))
            notificationManager.send(declineNotification, to: otherUser)
            
            // Find a way to attach the other user ID to the notification (search through the entire notification list to find the one notification with the other user's ID?)
        }
    }
    
    
    /// Check the database to see if there is a follower request notification already. If it does, then blur out the follow button. Don't blur otherwise.
    /// - Parameter otherUser: The other user whose ID will be used as the path to find the request notification
    /// - Returns: `true` if there's a notification, `false` otherwise
    public func hasRequested(otherUser: RECUser) -> Bool {
        // This path will take us inside the RECNotifications path, under the user ID but not inside any of the notification
        databaseRef.child(RECDatabaseParentPath.usersNotifications).child(otherUser.firebaseUID).getData { error, snapshot in
            // Upwrap the error and snapshot
            // The notification snapshot will now contain the JSON structure of each notification node
            guard let notifications = snapshot?.value as? NSDictionary, error == nil else {
                return
            }
            
            for notification in notifications {
                print(notification)
            }
        }
        
        return false
    }
    
    
    /// Check if the current user already follow the provided user. Use this function instead of `hasRequested()` which will be deprecated in the future.
    /// - Parameter otherUser: The user whose ID will be compared in the current user's followings array to see if they are already followed.
    /// - Returns: `true` if already followed. `false` otherwise.
    public func alreadyFollowed(_ otherUser: RECUser) -> Bool {
        guard let currentUser = loginVM.currentUser else {
            print("Cannot unwrap the current user, fatal exit!")
            exit(1)
        }
        
        for firUID in currentUser.followings {
            if firUID == otherUser.firebaseUID {
                return true
            }
        }
        return false
    }
    
    // MARK: - UNFOLLOW FUNCTIONALITIES
    
    /// Unfollow the other user by searching for the provided user from the current user's following list. **Note: Function implemented by me, revised by ChatGPT.**
    /// - Parameter otherUser: The provided user to search for in.
    /// - Returns: `true` if the UID exists and has been successfully removed. `false` otherwise. Returning a boolean helps SwiftUI to decide when to update the follow button and its associated user interface to reflect the changes made.
    public func unfollow(_ otherUser: RECUser) -> Bool {
        guard let currentUser = loginVM.currentUser else {
            return false
        }
        
        // Check if the element exists in the followings array
        guard let uidIndex = currentUser.followings.firstIndex(of: otherUser.firebaseUID) else {
            return false
        }
        
        var mutableCurrentUser = currentUser
        
        // Remove the UID from the followings array
        mutableCurrentUser.followings.remove(at: uidIndex)
        mutableCurrentUser.followingCount -= 1
        
        if !mutableCurrentUser.followings.isEmpty {
            for uid in mutableCurrentUser.followings {
                print(uid)
            }
        } else {
            print("Array is empty")
        }
        
        // Update the list on Firebase Database
        let updatedUser: [String: Any] = mutableCurrentUser.toDictionary()
        
        databaseRef.child(RECDatabaseParentPath.users).updateChildValues(updatedUser) { error, _ in
            if let error = error {
                print("Failed to update followings on database: \(error.localizedDescription)")
                return
            } else {
                print("Sucessfully updated followings in database")
            }
        }
        
        // Update loginVM's current user with the modified user, as well as removing the current user from the other's followers list
        loginVM.currentUser = mutableCurrentUser
        return removeFromFollowerList(otherUser)
    }
    
    /// Remove the current user from the other user's followers list. This operation takes place in the cloud and not locally on the device.
    /// - Parameter otherUser: The other user information to remove from
    /// - Returns: `true` if the removal was successful, `false` otherwise.
    public func removeFromFollowerList(_ otherUser: RECUser) -> Bool {
        guard let currentUser = loginVM.currentUser else {
            print("Cannot unwrap the current user")
            return false
        }
        
        let otherUserPath = databaseRef.child(RECDatabaseParentPath.users).child(otherUser.firebaseUID)
        
        // Remove the user node from under the followers node
        otherUserPath.child(RECUser.Property.followers).child(currentUser.firebaseUID).removeValue { error, _ in
            guard let error = error else {
                print(error?.localizedDescription ?? "Error occurred, unable to unwrap localted description")
                return
            }
        }
        
        // Update the follower count on the database by taking the value and subtracting 1 from it
        otherUserPath.runTransactionBlock { (currentData) -> TransactionResult in
            if var value = currentData.value as? [String: Any], let followerCount = value[RECUser.Property.followerCount] as? Int {
                // Update the follower count data
                value[RECUser.Property.followerCount] = followerCount - 1 as Any
                // Set the new data on the database
                currentData.value = value
                return TransactionResult.success(withValue: currentData)
            } else {
                return TransactionResult.success(withValue: currentData)
            }
        } andCompletionBlock: { (error, committed, snapshot) in
            if let error = error {
                print("Update follower count failed: \(error.localizedDescription)")
            } else {
                print("Update follower count success: \(committed)")
            }
        }
        
        print("Current user successfully removed from the followers list")
        return true
    }
}
