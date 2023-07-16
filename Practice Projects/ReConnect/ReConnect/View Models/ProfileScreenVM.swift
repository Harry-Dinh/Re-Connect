//
//  ProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import Foundation
import SwiftUI

class ProfileScreenVM: ObservableObject {
    static let viewModel = ProfileScreenVM()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    @Published var showEditProfileScreen = false
    @Published var showFollowerScreen = false
    @Published var showFollowingScreen = false
    
    /// Observe the change in the number of followers to update the user's verification level.
    public func observeChangeInFollowersCount() {
        if loginVM.loggedInUser?.followerCount ?? RECUser.placeholderUser.followerCount >= 1000 {
            loginVM.loggedInUser?.isVerifiedUser = true
        } else {
            loginVM.loggedInUser?.isVerifiedUser = false
        }
        // Update verification level here??
    }
}
