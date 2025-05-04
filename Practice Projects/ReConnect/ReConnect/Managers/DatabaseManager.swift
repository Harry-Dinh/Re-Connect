//
//  DatabaseManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-30.
//

import Foundation
import SwiftUI
import FirebaseDatabase

class DatabaseManager: ObservableObject {
    
    public static let instance = DatabaseManager()
    private let userDatabasePath = Database.database().reference().child(RECDatabaseParentPath.users)
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    
    // MARK: - RECUSER FETCHING

    // NOTE: Not sure if this function is necessary anymore, might modify or remove it altogether
    public func fetchData(of user: RECUser) {
        userDatabasePath.child(user.firebaseUID).getData { error, snapshot in
            guard let value = snapshot?.value as? [String: Any] else {
                print("Node has no value")
                return
            }

            let displayName = value[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
            let emailAddress = value[RECUser.Property.emailAddress] as? String ?? RECUser.placeholderUser.emailAddress
            let firebaseUID = value[RECUser.Property.firebaseUID] as? String ?? RECUser.placeholderUser.firebaseUID

            var fetchedUser = RECUser(displayName: displayName,
                                      emailAddress: emailAddress,
                                      firebaseUID: firebaseUID)
            fetchedUser.age = value[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
            fetchedUser.followerCount = value[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
            fetchedUser.followingCount = value[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
            fetchedUser.homeFeedIDs = value[RECUser.Property.homeFeedIDs] as? [String] ?? []
        }
    }

    public func fetchData(with userID: String, completion: @escaping (RECUser?) -> Void) {
        userDatabasePath.child(userID).getData { error, snapshot in
            guard let value = snapshot?.value as? [String: Any] else {
                print("Node has no value")
                completion(nil)
                return
            }

            let displayName = value[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
            let emailAddress = value[RECUser.Property.emailAddress] as? String ?? RECUser.placeholderUser.emailAddress
            let firebaseUID = value[RECUser.Property.firebaseUID] as? String ?? RECUser.placeholderUser.firebaseUID

            var fetchedUser = RECUser(displayName: displayName,
                                      emailAddress: emailAddress,
                                      firebaseUID: firebaseUID)
            fetchedUser.age = value[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
            fetchedUser.followerCount = value[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
            fetchedUser.followingCount = value[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
            fetchedUser.homeFeedIDs = value[RECUser.Property.homeFeedIDs] as? [String] ?? []

            // Return the fetched user using a completion handler
            completion(fetchedUser)
        }
    }
}
