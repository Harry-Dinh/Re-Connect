//
//  FollowingManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-07.
//

import Foundation
import SwiftUI

class FollowingManager: ObservableObject {
    public static let shared = FollowingManager()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    public func follow(_ otherUser: RECUser) {
        guard var currentUser = loginVM.loggedInUser else {
            return
        }
        
        if !otherUser.isProtectedAccount {
            currentUser.followingsUIDs.append(otherUser.getFirebaseUID())
            currentUser.followingCount += 1
            
            loginVM.loggedInUser = currentUser
        } else {
            
        }
    }
    
    public func requestToFollow(_ user: RECUser) {
        
    }
}
