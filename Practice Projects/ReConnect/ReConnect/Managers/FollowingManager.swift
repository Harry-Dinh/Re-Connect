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
    
    public func addUserToFollowingList(_ user: RECUser) {
        guard var currentUser = loginVM.loggedInUser else {
            // The current user does not exist
            return
        }
        
        // Update the current user info and assign it back to the observed user
        currentUser.followingsUIDs.append(user.getFirebaseUID())
        currentUser.followingCount = currentUser.followingsUIDs.count
        loginVM.loggedInUser = currentUser
        
        // Update the current and other user nodes on Firebase Database
        registerVM.writeUpdatedUserInfo(with: currentUser)
    }
    
    public func addUserToFollowerList(_ currentUser: RECUser, to otherUser: RECUser) {
        var mutableOtherUser = otherUser
        
        mutableOtherUser.followersUIDs.append(currentUser.getFirebaseUID())
        mutableOtherUser.followerCount = mutableOtherUser.followersUIDs.count
        
        registerVM.writeUpdatedUserInfo(with: mutableOtherUser)
    }
    
    public func follow(_ otherUser: RECUser) {
        guard let currentUser = loginVM.loggedInUser else {
            return
        }
        
        addUserToFollowingList(otherUser)
        addUserToFollowerList(currentUser, to: otherUser)
        
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
}
