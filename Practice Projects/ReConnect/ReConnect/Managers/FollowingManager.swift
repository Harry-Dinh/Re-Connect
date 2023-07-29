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
        loginVM.currentUser?.followings.append(user)
        
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        let otherUserJSONData: [String: Any] = user.toDictionary()
        databaseRef.child(RECDatabaseParentPath.users).child(currentUser.firebaseUID).child(RECUser.Property.followings).updateChildValues(otherUserJSONData)
    }
    
    public func addCurrentUserToFollowerList(of user: RECUser) {
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        var otherUser = user
        otherUser.followers.append(currentUser)
        
        let currentUserJSONData: [String: Any] = currentUser.toDictionary()
        databaseRef.child(RECDatabaseParentPath.users).child(otherUser.firebaseUID).child(RECUser.Property.followers).updateChildValues(currentUserJSONData)
    }
    
    // MARK: - FOLLOW & REQUEST FOLLOW ACTIONS
    
    public func follow(_ otherUser: RECUser) {
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        addUserToFollowingList(otherUser)
        addCurrentUserToFollowerList(of: otherUser)
        
        let notification = RECNotification(title: "New Follower",
                                           notificationDescription: "\(currentUser.displayName) has started following you",
                                           iconURL: "",
                                           notificationType: RECNotificationTypes.newFollower,
                                           actions: [],
                                           datePosted: DateFormatter().string(from: Date()))
        notificationManager.send(notification, to: otherUser)
    }
    
    public func requestToFollow(_ user: RECUser) {
        guard let currentUser = loginVM.currentUser else {
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
