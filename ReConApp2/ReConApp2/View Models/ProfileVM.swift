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
    
    public func updateUserInfo(user: ReConUser) {
        // Upload the pfp before updating the user data in order to get the pfp URL to load in the view later
        persistImageToStorage()
        
        let updatedValues: [String: Any] = [
            "age": user.age,
            "bio": user.bio,
            "email": user.email,
            "firstName": user.firstName,
            "gender": user.gender,
            "lastName": user.lastName,
            "username": user.username,
            "profile_pic_url": user.profilePicURL!
        ]
        
        databaseRef.child("ReConUsers").child(AuthVM.getUID()!).child("Info").updateChildValues(updatedValues)
    }
    
    public func persistImageToStorage() {
        let uid = AuthVM.getUID()
        let path = storageRef.reference(withPath: uid!)
        
        guard let imageData = self.profilePic?.jpegData(compressionQuality: 0.5) else { return }
        
        path.putData(imageData, metadata: nil) { [weak self] metadata, error in
            if let error = error {
                print("Cannot upload image data\n:Error: \(error.localizedDescription)")
                return
            }
            
            path.downloadURL { url, error in
                if let err = error {
                    print("Cannot download image data\nError: \(err.localizedDescription)")
                }
                
                print("Successfully downloaded URL\nURL: \(url?.absoluteString ?? "No URL")")
                let urlStr = url?.absoluteString
                self?.setProfilePic(urlStr: urlStr!)
            }
        }
    }
    
    private func setProfilePic(urlStr: String) {
        user.profilePicURL = urlStr
    }
    
    public static func getUserInfo() {
        ProfileVM.shared.databaseRef.child("ReConUsers").child(AuthVM.getUID()!).child("Info").observeSingleEvent(of: .value) { snapshot in
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
