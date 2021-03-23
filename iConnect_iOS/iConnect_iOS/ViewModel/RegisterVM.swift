//
//  RegisterVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import FirebaseAuth

class RegisterVM: ObservableObject {
    
    static let shared = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    public func registerUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard let result = result, error == nil else {
                print("Cannot create user with email: \(email)")
                return
            }
            
            let user = result.user
            
            self?.isSignedIn = true
            print("Successfully created user")
            print("User ID: \(user.uid)")
        }
    }
    
    /// Get the current user's FirebaseAuth unique identifier
    public func getUserUID() -> String {
        let uid = Auth.auth().currentUser?.uid
        
        return uid!
    }
}
