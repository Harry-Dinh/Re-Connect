//
//  ProfileVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI
import Firebase

class ProfileVM: ObservableObject {
    static let shared = ProfileVM()
    
    private var databaseRef = Database.database().reference()
    private var storageRef = Storage.storage().reference()
    
    @Published var firstName: String = ""
    @Published var middleName: String = ""
    @Published var lastName: String = ""
    @Published var fullName: String = ""
    @Published var username: String = ""
    @Published var isPrivateAccount: Bool = false
    @Published var dateOfBirth: String = ""
    
    // MARK: - SWIFTUI STATES
    @Published var showPrivateAccountPopUp: Bool = false
    @Published var editProfile: Bool = false
    @Published var isTextFieldEditing: Bool = false
    @Published var showImagePicker: Bool = false
    @Published var showCameraInterface: Bool = false
    @Published var showPhotoPickerActionSheet: Bool = false
    
    // MARK: - EDIT PROFILE
    @Published var profilePic: UIImage = UIImage()
    @Published var profilePicData: Data = Data()
    @Published var profilePicURL: String = ""
    
    // MARK: - METHODS
    public func fetchUserData() {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        // Fetch user's info
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").observeSingleEvent(of: .value) { [weak self] snapshot in
            if let value = snapshot.value as? [String: Any] {
                let first = value["firstName"] as! String
                let middle = value["middleName"] as! String
                let last = value["lastName"] as! String
                let dateOfBirth = value["dateOfBirth"] as! String
                let username = value["username"] as! String
                let isPrivateAccount = value["isPrivateAccount"] as! Bool
                
                self?.firstName = first
                self?.middleName = middle
                self?.lastName = last
                self?.dateOfBirth = dateOfBirth
                self?.username = username
                self?.isPrivateAccount = isPrivateAccount
            }
        }
        
        // Fetch user profile pic URL
        storageRef.child("Images").child("\(safeEmail)").child("Profile Pics").child("\(safeEmail)_\(uid)_profilePic.png").downloadURL(completion: { [weak self] url, error in
            guard let url = url, error == nil else {
                return
            }
            
            let urlString = url.absoluteString
            self?.profilePicURL = urlString
            print("Download URL: \(urlString)")
        })
    }
    
    public func uploadProfilePicData() {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        storageRef.child("Images").child("\(safeEmail)").child("Profile Pics").child("\(safeEmail)_\(uid)_profilePic.png").putData(profilePicData, metadata: nil) { [weak self] _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            
            self?.storageRef.child("Images").child("\(safeEmail)").child("Profile Pics").child("\(safeEmail)_\(uid)_profilePic.png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                self?.profilePicURL = urlString
                print("Download URL: \(urlString)")
            })
        }
    }
}
