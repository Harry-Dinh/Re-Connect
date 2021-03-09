//
//  LoginVM.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI
import Cocoa

class LoginVM: ObservableObject {
    
    static let main = LoginVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var showRegisterScreen = false
    @Published var emailField = ""
    @Published var passwordField = ""
    @Published var showAlert = false
    
    let errorAlertMessage = "The email or password you've entered is either not correct or not found. Please try again or press 'Forgot Password'. If those methods won't work, you could try to verify email or create a new account."
    
    /// This method will sign in with the current email and password. This will be connect with Firebase in the future.
    public func signInWithCurrentUser() {
        guard emailField.count >= 6,
              !emailField.isEmpty,
              emailField.contains("@"),
              !passwordField.isEmpty,
              passwordField.count >= 6 else {
            print("Failed to sign user in.")
            showAlert = true
            return
        }
        
        self.isSignedIn = true
        print("Successfully signed in.")
    }
}
