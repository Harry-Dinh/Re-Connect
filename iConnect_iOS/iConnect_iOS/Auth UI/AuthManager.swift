//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI
import FirebaseAuth

class AuthManager: ObservableObject {
    
    static let shared = AuthManager()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    private init() {}
    
    // MARK: Login Properties
    @Published var loginEmailField = ""
    @Published var loginPasswordField = ""
    @Published var showRegisterScreen = false
    @Published var showLoginAlertError = false
    
    // MARK: Register Properties
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var registerEmailField = ""
    @Published var registerPasswordField = ""
    @Published var showRegisterAlertError = false
    
    // MARK: - Login Methods
    
    public func signInWithCurrentUser() {
        let email = loginEmailField
        let password = loginPasswordField
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            self?.isSignedIn = true
            print("Successfully sign in user")
        }
    }
    
    // MARK: - Register Methods
    
    public func registerUser() {
        let firstName = firstNameField
        let lastName = lastNameField
        let email = registerEmailField
        let password = registerPasswordField
        
        guard !firstName.isEmpty,
              !lastName.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              email.contains("@"),
              password.count >= 6 else {
            showRegisterAlertError = true
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot create user with the email: \(email)")
                return
            }
            self?.isSignedIn = true
            print("Successfully created user with the email: \(email)")
        }
    }
}
