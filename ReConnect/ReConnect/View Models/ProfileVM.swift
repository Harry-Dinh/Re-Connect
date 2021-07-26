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
        
        // Fetch the user's full name and assign it to `fullName` variable.
        databaseRef.child("Users").child("\(safeEmail)").observeSingleEvent(of: .value) { [weak self] snapshot in
            if let value = snapshot.value as? [String: AnyObject] {
                let first = value["firstName"] as? String ?? "First"
                let middle = value["middleName"] as? String ?? ""
                let last = value["lastName"] as? String ?? "Last"
                let dateOfBirth = value["dateOfBirth"] as? String ?? "N/A"
                
                self?.dateOfBirth = dateOfBirth
                
                // Check if middle name is empty
                // If empty, do not assign middle to middleName
                if !middle.isEmpty {
                    self?.firstName = first
                    self?.middleName = middle
                    self?.lastName = last
                    
                    self?.fullName = "\(String(describing: self?.firstName)) \(String(describing: self?.middleName)) \(String(describing: self?.lastName))"
                }
                else {
                    self?.firstName = first
                    self?.lastName = last
                    
                    self?.fullName = "\(String(describing: self?.firstName)) \(String(describing: self?.lastName))"
                }
            }
            else {
                print("No value at all")
                self?.fullName = "Unknown User"
            }
        }
        
        databaseRef.child("Users").child("\(safeEmail)").observeSingleEvent(of: .value) { [weak self] snapshot in
            if let value = snapshot.value as? [String: AnyObject] {
                let username = value["username"] as? String ?? "@No Username"
                let isPrivateAccount = value["isPrivateAccount"] as? Bool ?? false
                
                self?.username = username
                self?.isPrivateAccount = isPrivateAccount
            }
            else {
                print("No value at all")
            }
        }
        
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
