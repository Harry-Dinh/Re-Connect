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
    public static let shared = FollowingManager()
    
    private let databaseRef = Database.database().reference()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var registerVM = RegisterScreenVM.viewModel
    @ObservedObject private var notificationManager = NotificationManager.shared
    
    // MARK: - UPDATE FOLLOWING & FOLLOWER LISTS
    
    public func addUserToFollowingList(_ user: RECUser) {
        guard var currentUser = loginVM.loggedInUser else {
            // The current user does not exist
            return
        }
        
        // Update the current user info and assign it back to the observed user
        currentUser.followingsUIDs.append(user.getFirebaseUID())
        currentUser.followingCount = currentUser.followingsUIDs.count
        loginVM.loggedInUser = currentUser
        loginVM.cacheLoggedInUser()
        loginVM.readLoggedInUser()
        
        // Update the current and other user nodes on Firebase Database
        updateFollowingsData(for: currentUser)
    }
    
    public func addToFollowerList(of currentUser: RECUser, with otherUser: RECUser) {
        var mutableOtherUser = otherUser
        
        mutableOtherUser.followersUIDs.append(currentUser.getFirebaseUID())
        mutableOtherUser.followerCount = mutableOtherUser.followersUIDs.count
        
        updateFollowersData(for: mutableOtherUser)
    }
    
    public func updateFollowersData(for user: RECUser) {
        let updatedFollowerData: [String: Any] = [
            "followerCount": user.followerCount,
            "followersUIDs": user.followersUIDs
        ]
        
        databaseRef.child(RECDatabaseParentPath.users).child(user.getFirebaseUID()).updateChildValues(updatedFollowerData)
    }
    
    public func updateFollowingsData(for user: RECUser) {
        let updatedFollowingData: [String: Any] = [
            "followingCount": user.followingCount,
            "followingsUIDs": user.followingsUIDs
        ]
        
        databaseRef.child(RECDatabaseParentPath.users).child(user.getFirebaseUID()).updateChildValues(updatedFollowingData)
    }
    
    // MARK: - FOLLOW & REQUEST FOLLOW ACTIONS
    
    public func follow(_ otherUser: RECUser) {
        guard let currentUser = loginVM.loggedInUser else {
            return
        }
        
        addUserToFollowingList(otherUser)
        addToFollowerList(of: currentUser, with: otherUser)
        
        let notification = RECNotification(title: "New Follower",
                                           notificationDescription: "\(currentUser.displayName) has started following you",
                                           iconURL: "",
                                           notificationType: RECNotificationTypes.newFollower,
                                           actions: [],
                                           datePosted: DateFormatter().string(from: Date()))
        notificationManager.send(notification, to: otherUser)
    }
    
    public func requestToFollow(_ user: RECUser) {
        guard let currentUser = loginVM.loggedInUser else {
            return
        }
        
        let followRequestNotification = RECNotification(title: "New Follower Request",
                                                        notificationDescription: "\(currentUser.displayName) has requested to follow you",
                                                        iconURL: CUPSystemIcon.userRequestAction,
                                                        notificationType: RECNotificationTypes.followerRequest,
                                                        actions: [RECNotificationActions.respondFollowerRequest, RECNotificationActions.rejectFollowerRequest],
                                                        datePosted: DateFormatter().string(from: Date()))
        notificationManager.send(followRequestNotification, to: user)
    }
    
    public func approveFollowerRequest(for user: RECUser) {
        
    }
}
