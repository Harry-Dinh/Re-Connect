//
//  LoginVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import Foundation
import Firebase
import SwiftUI

class LoginVM: ObservableObject {
    static let shared = LoginVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    // MARK: - SwiftUI States
    @Published var showRegisterScreen: Bool = false
    
    // MARK: - Auth Handlers
    @Published var alertTitle: String = "Login Error"
    @Published var alertMessage: String = "Looks like something's wrong! Please try checking your email or password again for any errors then try again. If that doesn't work, try changing your password instead if you forgot it."
    
    // MARK: - User Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: - User Methods
    public func signInCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot sign in user")
                self?.isSignedIn = false
                self?.email = ""
                self?.password = ""
                
                let alert = UIAlertController(title: self?.alertTitle, message: self?.alertMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))
                alert.addAction(UIAlertAction(title: "Forget Password", style: .default, handler: nil))
                UINavigationController().present(alert, animated: true, completion: nil)
                return
            }
            
            print("Successfully signed in.")
            self?.email = ""
            self?.password = ""
            self?.isSignedIn = true
        }
    }
    
    public func signOutCurrentUser() {
        do {
            try Auth.auth().signOut()
            self.isSignedIn = false
            ProfileVM.shared.fullName = ""
            ProfileVM.shared.displayEmail = ""
            ProfileVM.shared.dateOfBirth = ""
            ProfileVM.shared.isPrivateAccount = false
            ProfileVM.shared.username = ""
        }
        catch {
            print("Cannot sign out user")
        }
    }
}
