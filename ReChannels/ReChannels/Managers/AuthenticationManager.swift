//
//  AuthManager.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthenticationManager: ObservableObject {
    public static let shared = AuthenticationManager()
    
    @ObservedObject private var registerVM = RegisterVM.viewModel
    @ObservedObject private var loginVM = LoginVM.viewModel
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    /*
     Note: This app is pulling the data from the same Firebase server that Re:Connect uses. So rules, users and data can be used with Re:Channels immediately.
     Remember to modify your code for creating new users to work seamlessly with creating a new user for Re:Connect.
     */
    
    // MARK: - CREATE/SIGN IN USER
    
    public func createUser() {
        let localEmail = registerVM.emailField
        let localPass = registerVM.passwordField
        
        Auth.auth().createUser(withEmail: localEmail, password: localPass) { [weak self] authResult, error in
            guard error == nil else {
                // Failed to create account
                // Show code to show an alert...
                return
            }
            
            // Upload user data to Firebase Firestore
            // Make the data the primary user
            // Cache their data to UserDefaults
            // Clear all fields
            // Sign in
            self?.isSignedIn = true
        }
    }
    
    public func signIn() {
        let localEmail = loginVM.emailField
        let localPass = loginVM.passwordField
        
        Auth.auth().signIn(withEmail: localEmail, password: localPass) { [weak self] authResult, error in
            guard error == nil else {
                // Failed to sign in
                // Show code to show an alert...
                return
            }
            
            // Fetch user from Firebase Database
            // Make the data the primary user
            // Cache their data to UserDefaults
            // Clear all fields
            // Sign in
            self?.isSignedIn = true
        }
    }
}
