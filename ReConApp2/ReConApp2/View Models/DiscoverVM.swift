//
//  DiscoverVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-16.
//

import Foundation
import Firebase

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private let databaseRef = Database.database().reference()
    
    @Published var searchParam: String = ""
    @Published var users: [ReConUser] = []
    
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
                
                if firebaseUID != AuthVM.getUID() {
                    let user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings, firebaseUID: firebaseUID, profilePicURL: profilePicURL)
                    
                    self?.users.append(user)
                }
            }
        }
    }
}
