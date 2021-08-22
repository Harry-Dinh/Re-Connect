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
    private var firestoreRef = Firestore.firestore()
    private var storageRef = Storage.storage().reference()
    
    @Published var displayEmail: String = ""
    @Published var fullName: String = ""
    @Published var username: String = ""
    @Published var isPrivateAccount: Bool = false
    @Published var dateOfBirth: String = ""
    @Published var diagnosticPreferences: Bool = true
    @Published var followingCount: Int = 0
    
    // MARK: - SWIFTUI STATES
    @Published var showPrivateAccountPopUp: Bool = false
    @Published var editProfile: Bool = false
    @Published var isTextFieldEditing: Bool = false
    @Published var showImagePicker: Bool = false
    @Published var showCameraInterface: Bool = false
    @Published var showPhotoPickerActionSheet: Bool = false
    @Published var showMoreActionsSheet: Bool = false
    
    // MARK: - EDIT PROFILE
    @Published var profilePic: UIImage = UIImage()
    @Published var profilePicData: Data = Data()
    @Published var profilePicURL: String = ""
    @Published var unwrappedPFPURL: String = HelperMethods.shared.unwrapPFPURLFromUserDefaults()
    
    // MARK: - METHODS
    public func fetchUserData() {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Fetch user's info
        databaseRef.child("Users").child(uid).observeSingleEvent(of: .value) { [weak self] snapshot in
            if let value = snapshot.value as? [String: Any] {
                let fullName = value["fullName"] as? String ?? "Unnamed User"
                let username = value["username"] as? String ?? "No username"
                let dateOfBirth = value["dateOfBirth"] as? String ?? "Not specified"
                let isPrivateAccount = value["isPrivateAccount"] as? Bool ?? false
                let email = value["email"] as? String ?? "No email"
                let displayEmail = email.replacingOccurrences(of: "-", with: ".")
                let diagnosticPreferences = value["allowDiagnosticPreferences"] as? Bool ?? false
                let followingCount = value["followerUID"] as? Int ?? 0
                
                // Assign data to properties
                self?.fullName = fullName
                self?.username = username
                self?.dateOfBirth = dateOfBirth
                self?.isPrivateAccount = isPrivateAccount
                self?.displayEmail = displayEmail
                self?.diagnosticPreferences = diagnosticPreferences
                self?.followingCount = followingCount
            }
        }
    }
    
    public func fetchProfilePic() {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        let storagePath = storageRef.child("Images").child("\(safeEmail)")
        
        storagePath.child("\(safeEmail)_\(uid)_profilePic.png").downloadURL(completion: { [weak self] url, error in
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
        let storagePath = storageRef.child("Images").child("\(safeEmail)").child("\(safeEmail)_\(uid)_profilePic.png")
        
        storagePath.putData(profilePicData, metadata: nil) { [weak self] _, error in
            guard error == nil else {
                print("Failed to upload")
                return
            }
            
            storagePath.child("\(safeEmail)_\(uid)_profilePic.png").downloadURL(completion: { url, error in
                guard let url = url, error == nil else {
                    return
                }
                
                let urlString = url.absoluteString
                self?.profilePicURL = urlString
                print("Download URL: \(urlString)")
                UserDefaults.standard.setValue(urlString, forKey: "currentUserPFP")
                print("Successfully stored PFP data in UserDefaults")
            })
        }
    }
}
