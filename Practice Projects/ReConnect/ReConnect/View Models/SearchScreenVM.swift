//
//  SearchScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-12.
//

import Foundation
import FirebaseDatabase
import SwiftUI

class SearchScreenVM: ObservableObject {
    public static let viewModel = SearchScreenVM()
    
    private let databaseUsersPath = Database.database().reference().child(RECDatabaseParentPath.users)
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    @Published var searchQuery: String = ""
    
    @Published var usersSearchResult: [RECUser] = []
    
    public func fetchUsers(with searchQuery: String) {
        print("Fetching user method called")
        // Clear the previous fetch request before starting a new one
        self.usersSearchResult = []
        
        databaseUsersPath.observeSingleEvent(of: .value) { [weak self] snapshot in
            guard snapshot.hasChildren() else {
                print("\(RECDatabaseParentPath.users) node has no children")
                return
            }
            
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot,
                      let value = childSnapshot.value as? NSDictionary else {
                    continue
                }
                
                let firebaseUID = value[RECUser.Property.firebaseUID] as? String ?? RECUser.placeholderUser.getFirebaseUID()
                let displayName = value[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
                
                // `displayName.lowercased() == searchQuery` is the part of the code that only fetch the users whose display names match the search query
                if firebaseUID != self?.loginVM.loggedInUser?.getFirebaseUID() || displayName.lowercased() == searchQuery {
                    let age = value[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
                    let emailAddress = value[RECUser.Property.emailAddress] as? String ?? RECUser.placeholderUser.emailAddress
                    let followerCount = value[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
                    let followingCount = value[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
                    let isProtectedAccount = value[RECUser.Property.isProtectedAccount] as? Bool ?? RECUser.placeholderUser.isProtectedAccount
                    let pfpURL = value[RECUser.Property.pfpURL] as? String ?? RECUser.placeholderUser.pfpURL
                    let uid = value[RECUser.Property.uid] as? String ?? RECUser.placeholderUser.uid
                    let username = value[RECUser.Property.username] as? String ?? RECUser.placeholderUser.username
                    
                    var tempUser = RECUser(uid: uid,
                                           firebaseUID: firebaseUID,
                                           displayName: displayName,
                                           username: username,
                                           emailAddress: emailAddress,
                                           pfpURL: pfpURL,
                                           age: age,
                                           isProtectedAccount: isProtectedAccount)
                    tempUser.followerCount = followerCount
                    tempUser.followingCount = followingCount
                    
                    self?.usersSearchResult.append(tempUser)
                }
            }
        }
    }
    
    public func fetchUsers2(with searchQuery: String) {
        self.usersSearchResult.removeAll()
        
        databaseUsersPath.queryOrdered(byChild: "displayName").queryStarting(atValue: searchQuery).queryEnding(atValue: "\(searchQuery)\\uf8ff").observeSingleEvent(of: .value) { [weak self] snapshot in
            guard snapshot.hasChildren() else {
                // The current path has no children
                return
            }
            
            for child in snapshot.children {
                guard let userSnap = child as? DataSnapshot,
                      let value = userSnap.value as? [String: Any] else {
                    // The current child has no values
                    return
                }
                
                let firebaseUID = value[RECUser.Property.firebaseUID] as? String ?? RECUser.placeholderUser.getFirebaseUID()
                let displayName = value[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName

                let age = value[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
                let emailAddress = value[RECUser.Property.emailAddress] as? String ?? RECUser.placeholderUser.emailAddress
                let followerCount = value[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
                let followingCount = value[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
                let isProtectedAccount = value[RECUser.Property.isProtectedAccount] as? Bool ?? RECUser.placeholderUser.isProtectedAccount
                let pfpURL = value[RECUser.Property.pfpURL] as? String ?? RECUser.placeholderUser.pfpURL
                let uid = value[RECUser.Property.uid] as? String ?? RECUser.placeholderUser.uid
                let username = value[RECUser.Property.username] as? String ?? RECUser.placeholderUser.username
                
                var tempUser = RECUser(uid: uid,
                                       firebaseUID: firebaseUID,
                                       displayName: displayName,
                                       username: username,
                                       emailAddress: emailAddress,
                                       pfpURL: pfpURL,
                                       age: age,
                                       isProtectedAccount: isProtectedAccount)
                tempUser.followerCount = followerCount
                tempUser.followingCount = followingCount
                
                self?.usersSearchResult.append(tempUser)
            }
        }
    }
}
