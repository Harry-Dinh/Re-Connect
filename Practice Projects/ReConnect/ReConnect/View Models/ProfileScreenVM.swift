//
//  ProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import Foundation
import SwiftUI

class ProfileScreenVM: ObservableObject {
    static let instance = ProfileScreenVM()
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    
    @Published var showEditProfileScreen = false
    @Published var showFollowerScreen = false
    @Published var showFollowingScreen = false
    @Published var showPostCreationScreen = false

    /// Observe the change in the number of followers to update the user's verification level.
    public func observeChangeInFollowersCount() {
        if loginVM.currentUser?.followerCount ?? RECUser.placeholderUser.followerCount >= RECConstants.verifiedNumFollowers {
            loginVM.currentUser?.isVerifiedUser = true
        } else {
            loginVM.currentUser?.isVerifiedUser = false
        }
        // Update verification level here??
    }
}
