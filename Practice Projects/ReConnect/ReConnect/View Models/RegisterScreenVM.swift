//
//  RegisterScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

class RegisterScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = RegisterScreenVM()
    
    /// The reference to Firebase Database.
    private let databaseReference = Database.database().reference()
    
    enum FocusFields: Hashable {
        case firstName
        case lastName
        case email
        case password
    }
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    @ObservedObject var loginVM = LoginScreenVM.viewModel
    
    /// The first name field
    @Published var firstNameField = ""
    
    /// The last name field
    @Published var lastNameField = ""
    
    /// The email address field
    @Published var emailField = ""
    
    /// The password field
    @Published var passwordField = ""
    
    // MARK: - STATES FOR SWIFTUI VIEWS
    
    /// A toggle to push and pop to the detailed registration view. **Trigger this after the registration function is called.**
    @Published var pushToDetailedRegistration = false
    
    // MARK: - ERROR ALERTS
    
    /// This boolean becomes `true` when the `signIn()` function exit early without getting to the authentication sequence.
    @Published var showEmailNotValidAlert = false
    
    /// This boolean becomes `true` when the `signIn()` function failed to create the user account using Firebase authentication API.
    @Published var firebaseAccountCreationFailed = false
    
    /// This boolean becomes `true` when the `signIn()` function failed to unwrap the user's email and display name after account creation is successful.
    @Published var failedToUnwrapUserInfo = false
    
    // MARK: - FUNCTIONS
    
    /// Create a user account using Firebase authentication API. The created credentials will be securely stored on Firebase Auth server.
    /// - Parameters:
    ///   - email: The user's email (needs to be checked for error before proceed to calling the `createUser()` method.
    ///   - password: The user's password to protect the account.
    public func createAccount(with email: String, and password: String) {
        if !email.contains("@") {
            showEmailNotValidAlert = true
            return
        }
        
        let displayName = "\(firstNameField) \(lastNameField)"
        
        print("Email verification passed")
        
        // Email verification passed
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let result = authResult, error == nil else {
                self?.firebaseAccountCreationFailed = true
                return
            }
            
            print("Successfully create user account")
            
            guard let emailAddress = result.user.email else {
                self?.failedToUnwrapUserInfo = true
                return
            }
            
            let tempUser = RECUser(displayName: displayName, emailAddress: emailAddress, firebaseUID: result.user.uid)
            self?.loginVM.loggedInUser = tempUser
            print("loggedInUser assigned")
            self?.writeToDatabase(with: self?.loginVM.loggedInUser ?? tempUser)
        }
    }
    
    /// Write the existing user data (`uid`, `emailAddress` and `displayName`) to Firebase Database.
    /// - Parameter user: The user's data to write to the database.
    public func writeToDatabase(with user: RECUser) {
        let userData: [String: Any] = [
            "uid": user.getUID(),
            "displayName": user.displayName,
            "emailAddress": user.emailAddress,
            "firebaseUID": user.getFirebaseUID(),
            "followersUIDs": user.followersUIDs,
            "followingsUIDs": user.followingsUIDs,
            "followerCount": user.followerCount,
            "followingCount": user.followingCount,
            "pfpURL": user.pfpURL ?? "",
            "isVerified": user.isVerifiedUser
        ]
        
        // This line means write data above in the path: RECUsers/user.uid/
        databaseReference.child(RECDatabaseParentPath.users).child(user.getFirebaseUID()).setValue(userData)
    }
    
    /// Update instead of overwriting the user's data with the latest information
    /// - Parameter user: The data to be updated in the given path.
    public func writeUpdatedUserInfo(with user: RECUser) {
        let userData: [String: Any] = [
            "uid": user.getUID(),
            "displayName": user.displayName,
            "username": user.username,
            "emailAddress": user.emailAddress,
            "pfpURL": user.pfpURL ?? "",
            "age": user.age,
            "isProtectedAccount": user.isProtectedAccount,
            "firebaseUID": user.getFirebaseUID(),
            "isVerified": user.isVerifiedUser,
            "followingCount": user.followingCount,
            "followerCount": user.followerCount,
            "followersUIDs": user.followersUIDs,
            "followingsUIDs": user.followingsUIDs
        ]
        
        // This line means update data above in the path: RECUsers/user.uid/
        databaseReference.child(RECDatabaseParentPath.users).child(user.getFirebaseUID()).updateChildValues(userData)
    }
}
