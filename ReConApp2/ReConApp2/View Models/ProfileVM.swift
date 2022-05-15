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
    
    /// An object that represent the current user.
    @Published var user: ReConUser = ReConUser()
    @Published var profilePic: UIImage?
    
    // SwiftUI States
    @Published var showEditProfileView = false
    @Published var showPhotoPicker = false
    @Published var showCameraView = false
    @Published var showPhotoPickerActionSheet = false
    @Published var showAlertProfilePicURL = false
    @Published var showEditPfpSpinner = false
    @Published var showFollowersList = false
    @Published var showFollowingList = false
    @Published var showQRCodeScanner = false
    
    @AppStorage("biometricEnabled") var biometricEnabled = false
    
    public func updateUserInfo(user: ReConUser) {
        
        let uid = user.firebaseUID
        
        // Upload data
        let updatedValues: [String: Any] = [
            "age": user.age,
            "bio": user.bio,
            "email": user.email,
            "firstName": user.firstName,
            "gender": user.gender,
            "lastName": user.lastName,
            "username": user.username,
            "profile_pic_url": user.profilePicURL ?? "No URL",
            "isPrivateAccount": user.isPrivateAccount,
            "followings": user.followingCount,
            "followers": user.followerCount
        ]
        
        databaseRef.child("ReConUsers").child(uid).updateChildValues(updatedValues)
    }
    
    // Writing and reading objects from UserDefaults curtisey of: https://medium.com/@herlinaastari/store-a-custom-object-with-userdefaults-in-swift-5-2bbacfd92c8a
    
//    /// Write the current user as a `ReConUser` object to `UserDefaults`. Note that the `getCurrentUserInfo()` method had to run before calling this method.
//    public func writeUserToDefaults() {
//        do {
//            let user = ProfileVM.shared.user
//            let encoder = JSONEncoder()
//            let data = try encoder.encode(user)
//            UserDefaults.standard.set(data, forKey: "currentUser")
//            print("Successfully write data to UserDefaults")
//        }
//        catch {
//            print("Cannot write user info to UserDefaults")
//        }
//    }
//    
//    /// Read the data of the current user from `UserDefaults` then write it to a `ReConUser` object that will be returned.
//    /// - Returns: An optional `ReConUser` object (the data can be `nil` and therefore the object is optional to prevent crashes.)
//    public func readUserFromDefaults() -> ReConUser? {
//        guard let data = UserDefaults.standard.data(forKey: "currentUser") else {
//            print("Cannot read user data")
//            return nil
//        }
//        
//        do {
//            let decoder = JSONDecoder()
//            let user = try decoder.decode(ReConUser.self, from: data)
//            print("Successfully read data to UserDefaults")
//            return user
//        }
//        catch {
//            print("Cannot read the user data or key does not exist")
//        }
//        
//        return nil
//    }
    
    public func returnUserInfo(firebaseUID: String, completion: @escaping (ReConUser?) -> Void) {
        var followingUser: ReConUser = ReConUser()
        
        databaseRef.child("ReConUsers").child(firebaseUID).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                completion(nil)
                return
            }
            
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
            let isPrivateAccount = value["isPrivateAccount"] as? Bool ?? false
            
            followingUser = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings, firebaseUID: firebase_uid, profilePicURL: profilePicURL, isPrivateAccount: isPrivateAccount)
            
            completion(followingUser)
        }
    }
    
    public func fetchFollowings() {
        user.followings = []
        
        databaseRef.child("ReConUsers").child(AuthVM.getUID()!).child("Followings").observeSingleEvent(of: .value) { [weak self] snapshot in
            // Loop through every node (Firebase UID of other users) and call the `getUserInfo(firebaseUID: String)` method to get that user and append to `currentUser.followers`
            if let value = snapshot.value as? [String: Any] {
                for key in value.keys {
                    self?.returnUserInfo(firebaseUID: key) { followingUser in
                        guard let followingUser = followingUser else {
                            return
                        }
                        
                        self?.user.followings.append(followingUser)
                    }
                }
            }
        }
    }
    
    public func fetchFollowers() {
        user.followers = []
        
        databaseRef.child("ReConUsers").child(AuthVM.getUID()!).child("Followers").observeSingleEvent(of: .value) { [weak self] snapshot in
            if let value = snapshot.value as? [String: Any] {
                for key in value.keys {
                    self?.returnUserInfo(firebaseUID: key) { followingUser in
                        guard let followingUser = followingUser else {
                            return
                        }
                        
                        self?.user.followers.append(followingUser)
                    }
                }
            }
        }
    }
    
    // MARK: - CLASS METHODS
    
    /// Fetch the current user information and store them in a `ReConUser` object locally on the device
    public static func getCurrentUserInfo() {
        ProfileVM.shared.databaseRef.child("ReConUsers").child(AuthVM.getUID()!).observeSingleEvent(of: .value) { snapshot in
            if let value = snapshot.value as? [String: Any] {
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
                let isPrivateAccount = value["isPrivateAccount"] as? Bool ?? false
                
                // Initialize the user object with the fetched data
                ProfileVM.shared.user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: bio, age: age, gender: gender, followerCount: followers, followingCount: followings, firebaseUID: firebase_uid, profilePicURL: profilePicURL, isPrivateAccount: isPrivateAccount)
            }
        }
    }
}
