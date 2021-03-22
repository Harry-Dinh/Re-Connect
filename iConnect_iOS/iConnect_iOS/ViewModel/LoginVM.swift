//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import UIKit
import FirebaseAuth

class LoginVM: ObservableObject {
    
    static let shared = LoginVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var showRegisterScreen: Bool = false
    
    /// Sign in with the current email and password.
    public func signInWithCurrentUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                
                let alert = UIAlertController(title: "Error Title", message: "Error Message", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            
            self?.isSignedIn = true
            print("Successfully signed user in")
        }
    }
    
    /// Sign out with the current user.
    public func signOutUser() {
        do {
            try Auth.auth().signOut()
            print("Successfully signed out")
        }
        catch {
            print("Something went wrong, cannot sign user out. Error: \(error.localizedDescription)")
        }
    }
}
