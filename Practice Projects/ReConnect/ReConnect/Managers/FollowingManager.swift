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
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var registerVM = RegisterScreenVM.viewModel
    @ObservedObject private var notificationManager = NotificationManager.shared
    
    // MARK: - UPDATE FOLLOWING & FOLLOWER LISTS
    
    /// Add a user to the following list of the *current* user, as well as updating that list data on the database.
    /// - Parameter user: The user to add to the following list
    public func addUserToFollowingList(_ user: RECUser) {
        // Add the following user to the local followings array
        loginVM.currentUser?.followings.append(user)
        
        // Get a reference to the current user? Not sure why I did this before, maybe to prevent some sort of Swift's optional unwrapping issue?
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        // Turn the passed in user data into JSON and update the followings array on the database
        let otherUserJSONData: [String: Any] = user.toDictionary()
        databaseRef.child(RECDatabaseParentPath.users).child(currentUser.firebaseUID).child(RECUser.Property.followings).updateChildValues(otherUserJSONData)
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
        otherUser.followers.append(currentUser)
        
        // Turn the current user's data into JSON and update the other user's database entry
        let currentUserJSONData: [String: Any] = currentUser.toDictionary()
        databaseRef.child(RECDatabaseParentPath.users).child(otherUser.firebaseUID).child(RECUser.Property.followers).updateChildValues(currentUserJSONData)
    }
    
    
    // MARK: - FOLLOW & REQUEST FOLLOW ACTIONS
    
    
    /// A function that contains the actions that will occur when the *current* user taps the "Follow" button
    /// - Parameter otherUser: The user to follow (this is passed in so that the app knows where to update the data on the receiving end)
    public func follow(_ otherUser: RECUser) {
        // Get a reference to the current user
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        // Call the functions to add the OTHER user to the CURRENT user's followings list; and the function that adds the CURRENT user to the OTHER user's followers list
        addUserToFollowingList(otherUser)
        addCurrentUserToFollowerList(of: otherUser)
        
        // Create and send a notification to the OTHER user to inform them that they have a new follower
        let notification = RECNotification(title: "New Follower",
                                           notificationDescription: "\(currentUser.displayName) has started following you",
                                           iconURL: "",
                                           notificationType: RECNotificationTypes.newFollower,
                                           actions: [],
                                           datePosted: DateFormatter().string(from: Date()))
        notificationManager.send(notification, to: otherUser)
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
            guard let notificationSnapshot = snapshot?.value as? [String: Any], error == nil else {
                return
            }
            
            let notificationValues = notificationSnapshot.values
            
            
        }
        
        return false
    }
}
