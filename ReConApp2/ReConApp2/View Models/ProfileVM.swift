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
    let storageRef = Storage.storage()
    
    enum Fields: Hashable {
        case firstName
        case lastName
        case email
        case username
        case bio
    }
    
    @Published var user: ReConUser = ReConUser()
    @Published var profilePic: UIImage?
    
    // SwiftUI States
    @Published var showEditProfileView = false
    @Published var showPhotoPicker = false
    @Published var showCameraView = false
    @Published var showPhotoPickerActionSheet = false
    @Published var showAlertProfilePicURL = false
    
    public func updateUserInfo(user: ReConUser) {
        
        let uid = AuthVM.getUID()!
        
        // Upload data
        let updatedValues: [String: Any] = [
            "age": user.age,
            "bio": user.bio,
            "email": user.email,
            "firstName": user.firstName,
            "gender": user.gender,
            "lastName": user.lastName,
            "username": user.username,
            "profile_pic_url": user.profilePicURL ?? "No URL"
        ]
        
        databaseRef.child("ReConUsers").child(uid).updateChildValues(updatedValues)
    }
    
    public static func getUserInfo() {
        ProfileVM.shared.databaseRef.child("ReConUsers").child(AuthVM.getUID()!).observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? [String: AnyObject] {
                let age = value["age"] as? Int ?? 0
                let bio = value["bio"] as? String ?? "No bio"
                let email = value["email"] as? String ?? "No Email"
                let firebase_uid = value["firebase_uid"] as? String ?? ""
                let firstName = value["firstName"] as? String ?? "Unnamed"
                let followers = value["followers"] as? Int ?? 0
                let followings = value["followings"] as? Int ?? 0
                let gender = value["gender"] as? Int ?? -1
                let lastName = value["lastName"] as? String ?? "User"
                let username = value["username"] as? String ?? "No username"
                let profilePicURL = value["profile_pic_url"] as? String ?? ""
                
                ProfileVM.shared.user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings, firebaseUID: firebase_uid, profilePicURL: profilePicURL)
            }
        }
    }
}
