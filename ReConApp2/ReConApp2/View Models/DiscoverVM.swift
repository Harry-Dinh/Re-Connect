//
//  DiscoverVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-16.
//

import Foundation
import Firebase

class DiscoverVM: ObservableObject {
    
    /// A shared instance of `DiscoverVM()`.
    static let shared = DiscoverVM()
    
    /// A reference to Firebase Database
    private let databaseRef = Database.database().reference()
    
    /// The search parameter to search for posts and users whose values contain the letters in the search parameter.
    @Published var searchParam: String = ""
    
    /// An array of `ReConUser` used to store the users info fetched by the `getAllUsers()` method. It is also used with the `searchParam` variable to make local searching available.
    @Published var users: [ReConUser] = []
    
    @Published var showFollowingIndicator: Bool = false
    
    /// Retrieve all users data in Firebase Database
    public func getAllUsers() {
        users = []
        
        databaseRef.child("ReConUsers").observeSingleEvent(of: .value) { [weak self] snapshot in
            for case let child as DataSnapshot in snapshot.children {
                guard let value = child.value as? [String: Any] else {
                    print("No value")
                    return
                }
                
                let age = value["age"] as? Int ?? -1
                let bio = value["bio"] as? String ?? ""
                let email = value["email"] as? String ?? ""
                let firebaseUID = value["firebase_uid"] as? String ?? ""
                let firstName = value["firstName"] as? String ?? ""
                let followers = value["followers"] as? Int ?? 0
                let followings = value["followings"] as? Int ?? 0
                let gender = value["gender"] as? Int ?? -1
                let lastName = value["lastName"] as? String ?? ""
                let profilePicURL = value["profile_pic_url"] as? String ?? ""
                let username = value["username"] as? String ?? ""
                let isPrivateAccount = value["isPrivateAccount"] as? Bool ?? false
                
                if firebaseUID != ProfileVM.shared.user.firebaseUID {
                    let user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings, firebaseUID: firebaseUID, profilePicURL: profilePicURL, isPrivateAccount: isPrivateAccount)
                    
                    self?.users.append(user)
                }
            }
        }
    }
    
    /// Actions taken to "follow" another user on Re:Connect.
    /// - Parameter otherUser: A `ReConUser` object that represent the other user.
    public func followUser(user: ReConUser) {
        var currentUser = ProfileVM.shared.user
        var otherUser = user
        
        showFollowingIndicator = true
        
        if otherUser.isPrivateAccount {
            
            // CREATE A REQUEST IN A FORM OF A RECONNOTIFICATION
            //----------------------------
            let notificationTitle = "\(currentUser.fullName) has requested to follow you"
            let date = Date()
            var icon: String
            
            if currentUser.profilePicURL == "" {
                icon = "person.crop.circle.fill"
            }
            else {
                icon = currentUser.profilePicURL!
            }
            
            let notification = ReConNotification(title: notificationTitle, subtitle: "", date: date, icon: icon, type: .followerRequest)
            
            // SEND THE NOTIFICATION TO THE OTHER USER'S DATABASE NODE
            //----------------------------
            
            NotificationVM.shared.insertNotification(notification: notification, user: otherUser)
        }
        else {
            
            // UPDATE FOR THE CURRENT USER
            // ---------------------------
            
            let followingUpdate: [String: Any] = [ otherUser.firebaseUID: otherUser.firebaseUID ]
            let infoUpdate: [String: Any] = [ "followings": currentUser.followingCount + 1 ]
            
            // Save followed user on database
            
            databaseRef.child("ReConUsers").child(currentUser.firebaseUID).updateChildValues(infoUpdate)
            databaseRef.child("ReConUsers").child(currentUser.firebaseUID).child("Followings").updateChildValues(followingUpdate)
            
            // Save followed user locally on device
            
            currentUser.followings.append(otherUser)
            
            ProfileVM.shared.fetchFollowings()
            
            // UPDATE FOR THE OTHER USER
            // -------------------------
            
            let followerUpdate: [String: Any] = [ currentUser.firebaseUID: currentUser.firebaseUID ]
            let otherInfoUpdate: [String: Any] = [ "followers": otherUser.followerCount + 1 ]
            
            // Save follower info on database
            
            databaseRef.child("ReConUsers").child(otherUser.firebaseUID).updateChildValues(otherInfoUpdate)
            databaseRef.child("ReConUsers").child(otherUser.firebaseUID).child("Followers").updateChildValues(followerUpdate)
            
            // Save follower info locally on device
            
            otherUser.followers.append(currentUser)
        }
        
        showFollowingIndicator = false
    }
    
    public func isFollowing(user: ReConUser) -> Bool {
        let currentUser = ProfileVM.shared.user
        
        for otherUser in currentUser.followings {
            if otherUser.firebaseUID == user.firebaseUID {
                return true
            }
        }
        return false
    }
}
