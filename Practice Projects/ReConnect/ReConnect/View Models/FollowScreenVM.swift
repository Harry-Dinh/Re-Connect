//
//  FollowScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-04-30.
//

import Foundation
import SwiftUI
import FirebaseDatabase

/// The view model for the `FollowerScreen` and `FollowingScreen`.
class FollowScreenVM: ObservableObject {
    
    private let loginVM = LoginScreenVM.instance
    private let databaseRef = Database.database().reference().child(RECDatabaseParentPath.users)
    
    /// The shared instance of the FollowScreenVM class.
    public static let instance = FollowScreenVM()
    
    /// An array of `RECUser` that stored the data of followers fetched from the server.
    @Published var localFollowers: [RECUser] = []
    
    /// An array of `RECUser` that stores the data of following people from the server.
    @Published var localFollowings: [RECUser] = []
    
    /// A SwiftUI condition to refresh the followers page.
    @Published var refreshFollowers = false
    
    /// A SwiftUI condition to refresh the followings page.
    @Published var refreshFollowings = false
    
    public func fetchFollowers() {
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        localFollowers.removeAll()
        
        databaseRef.observeSingleEvent(of: .value) { snapshot in
            guard snapshot.exists() else {
                print("No nodes exists")
                return
            }
            
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot else { continue }
                let nodeKey = childSnapshot.key
                
                if currentUser.followers.contains(nodeKey) {
                    guard let userValue = childSnapshot.value as? [String: Any] else {
                        return
                    }
                    
                    let age = userValue[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
                    let displayName = userValue[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
                    let followerCount = userValue[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
                    let followingCount = userValue[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
                    let isProtectedAccount = userValue[RECUser.Property.isProtectedAccount] as? Bool ?? RECUser.placeholderUser.isProtectedAccount
                    let isVerified = userValue[RECUser.Property.isVerified] as? Bool ?? RECUser.placeholderUser.isVerifiedUser
                    let pfpURL = userValue[RECUser.Property.pfpURL] as? String ?? ""
                    let username = userValue[RECUser.Property.username] as? String ?? RECUser.placeholderUser.username
                    
                    var following = RECUser(firebaseUID: nodeKey, displayName: displayName, username: username, emailAddress: RECUser.placeholderUser.emailAddress, pfpURL: pfpURL, age: age, isProtectedAccount: isProtectedAccount)
                    following.isVerifiedUser = isVerified
                    following.followerCount = followerCount
                    following.followingCount = followingCount
                    self.localFollowers.append(following)
                }
            }
        }
    }
    
    
    public func fetchFollowings() {
        guard let currentUser = loginVM.currentUser else {
            return
        }
        
        localFollowings.removeAll()
        
        databaseRef.observeSingleEvent(of: .value) { snapshot in
            guard snapshot.exists() else {
                print("No nodes exists")
                return
            }
            
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot else { continue }
                let nodeKey = childSnapshot.key
                
                if currentUser.followings.contains(nodeKey) {
                    guard let userValue = childSnapshot.value as? [String: Any] else {
                        return
                    }
                    
                    let age = userValue[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
                    let displayName = userValue[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
                    let followerCount = userValue[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
                    let followingCount = userValue[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
                    let isProtectedAccount = userValue[RECUser.Property.isProtectedAccount] as? Bool ?? RECUser.placeholderUser.isProtectedAccount
                    let isVerified = userValue[RECUser.Property.isVerified] as? Bool ?? RECUser.placeholderUser.isVerifiedUser
                    let pfpURL = userValue[RECUser.Property.pfpURL] as? String ?? ""
                    let username = userValue[RECUser.Property.username] as? String ?? RECUser.placeholderUser.username
                    
                    var following = RECUser(firebaseUID: nodeKey, displayName: displayName, username: username, emailAddress: RECUser.placeholderUser.emailAddress, pfpURL: pfpURL, age: age, isProtectedAccount: isProtectedAccount)
                    following.isVerifiedUser = isVerified
                    following.followerCount = followerCount
                    following.followingCount = followingCount
                    self.localFollowings.append(following)
                }
            }
        }
    }
}
