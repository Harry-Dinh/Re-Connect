//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

class LoginVM: ObservableObject {
    
    static let shared = LoginVM()
    
    // MARK: - SwiftUI Properties
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField = ""
    @Published var passwordField = ""
    @Published var showLoginErrorAlert = false
    
    // MARK: - Non SwiftUI Properties
    
    let alertTitle = "An Error Occurred"
    let alertMessage = "The email or password you entered is not correct. Please try again or create a new account."
    
    // MARK: - Methods
    
    public func signInWithCurrentUser() {
        guard !emailField.isEmpty,
              !passwordField.isEmpty,
              emailField.count >= 6,
              emailField.contains("@"),
              passwordField.count >= 6 else {
            print("An error occurred, cannot sign in")
            showLoginErrorAlert = true
            return
        }
        
        isSignedIn = true
        print("Successfully signed in")
    }
}
