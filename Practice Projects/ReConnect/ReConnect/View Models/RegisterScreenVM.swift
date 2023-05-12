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
    
    /// This will replace the "Continue" text view in the button with a loading indicator. Showing that it's processing the information.
    @Published var showButtonLoadingIndicator = false
    
    /// This boolean will trigger the push navigation sequence to the next registration view to finish filling out any information
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
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let result = authResult, error == nil else {
                self?.firebaseAccountCreationFailed = true
                return
            }
            
            // Successfully create user account
            
            /*
             1. Write the user's name and email address to Firebase Database
             2. Unwrap the user's email address and display name to cache on the device for faster performance
             3. Perform segue to the next registration screen.
             */
            
            guard let emailAddress = result.user.email,
                  let displayName = result.user.displayName else {
                self?.failedToUnwrapUserInfo = true
                return
            }
            
            self?.showButtonLoadingIndicator = true
            
            let tempUser = RECUser(displayName: displayName, emailAddress: emailAddress)
            self?.writeToDatabase(with: tempUser)
            self?.loginVM.loggedInUser = tempUser
            
            self?.showButtonLoadingIndicator = false
            
            // Perform segue to the next registration screen. Do this using programmatic push navigation instead of NavigationLink.
            self?.pushToDetailedRegistration.toggle()
        }
    }
    
    /// Write the existing user data (`uid`, `emailAddress` and `displayName`) to Firebase Database.
    /// - Parameter user: The user's data to write to the database.
    public func writeToDatabase(with user: RECUser) {
        let userData: [String: Any] = [
            "uid": user.getUID(),
            "displayName": user.displayName,
            "emailAddress": user.emailAddress
        ]
        
        // This line means write data above in the path: RECUsers/user.uid/
        databaseReference.child("RECUsers").child(user.getUID()).setValue(userData)
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
            "isProtectedAccount": user.isProtectedAccount
        ]
        
        // This line means update data above in the path: RECUsers/user.uid/
        databaseReference.child("RECUsers").child(user.getUID()).updateChildValues(userData)
    }
}
