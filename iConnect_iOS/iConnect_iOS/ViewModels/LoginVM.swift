//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Firebase
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
    
    public func signInWithCurrentUser(completion: @escaping () -> Void) {
        let email = emailField
        let password = passwordField
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                print("Failed to sign in with email: \(email)")
                return
            }
            
            completion()
        }
    }
}
