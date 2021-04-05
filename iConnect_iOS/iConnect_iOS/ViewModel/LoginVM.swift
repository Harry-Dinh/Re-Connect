//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import UIKit
import Firebase

class LoginVM: ObservableObject {
    
    static let shared = LoginVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var showRegisterScreen: Bool = false
    
    let alertTitle = "Login Error"
    let alertMessage = "The email or password you entered is not correct. Please check them and try again."
    
    /// Sign in with the current email and password.
    public func signInWithCurrentUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                
                let alert = UIAlertController(title: self?.alertTitle, message: self?.alertMessage, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            
            self?.emailField = ""
            self?.passwordField = ""
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
    
    public func deleteUser() {
        
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = DatabaseManager.shared.convertToSafeEmail(with: email)
        
        Firestore.firestore().document("Users/\(safeEmail)_\(currentUserID)").delete { (error) in
            guard error == nil else {
                print("Cannot delete user (\(safeEmail))'s data from Firestore, error: \(error!.localizedDescription)")
                return
            }
            
            print("Successfully delete user data")
        }
        
        Database.database().reference().child("Posts").child("\(safeEmail)_\(currentUserID)").removeValue()
        
        Auth.auth().currentUser?.delete(completion: { [weak self] (error) in
            guard error == nil else {
                print("Cannot delete user, error: \(error!.localizedDescription)")
                return
            }
            
            print("Successfully delete user")
            self?.isSignedIn = false
        })
    }
}
