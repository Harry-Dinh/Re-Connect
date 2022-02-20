//
//  ProfileVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import Foundation
import SwiftUI
import Firebase

class ProfileVM: ObservableObject {
    static let shared = ProfileVM()
    
    let databaseRef = Database.database().reference()
    
    @Published var user: ReConUser = ReConUser()
    
    public static func getUserInfo() {
        ProfileVM.shared.databaseRef.child("ReConUsers").queryOrderedByKey().observeSingleEvent(of: .value) { snapshot in
            let value = snapshot.value as? NSDictionary
            
            // User Data
            let age = value!["age"] as! Int
            let bio = value!["bio"] as! String
            let email = value!["email"] as! String
            let firstName = value!["firstName"] as! String
            let lastName = value!["lastName"] as! String
            let followers = value!["followers"] as! Int
            let followings = value!["followings"] as! Int
            let gender = value!["gender"] as! Int
            let username = value!["username"] as! String
            
            ProfileVM.shared.user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings)
        }
    }
}
