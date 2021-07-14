//
//  AuthVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI
import Firebase

class LoginVM: ObservableObject {
    static let shared = LoginVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var showRegister: Bool = false
    
    /// Sign in with the registered `email` and `password`. Also fetch the user's `firstName`, `lastName` and `username` for displaying in `ProfileView()`.
    public func signInWithCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            // MARK: Get user's profile info
            let safeEmail = Methods.shared.convertToSafeEmail(email: email)
            guard let currentUserID = Auth.auth().currentUser?.uid else {
                return
            }
            
            Database.database().reference().child("Users").child("User \(safeEmail)_\(currentUserID)").observeSingleEvent(of: .value) { snapshot in
                let userDict = snapshot.value as! [String: Any]
                
                let firstName = userDict["first_name"] as! String
                let lastName = userDict["last_name"] as! String
                let username = userDict["username"] as! String
                
                UserDefaults.standard.set(firstName, forKey: "currentUserFirstName")
                UserDefaults.standard.set(lastName, forKey: "currentUserLastName")
                ProfileVM.shared.username = username
            }
            
            print("Successfully signed in")
            self?.isSignedIn = true
        }
    }
    
    /// Sign out the current user and remove any values from `currentUserFirstName` and `currentUserLastName` from `UserDefaults`.
    public func signOutUser() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.removeObject(forKey: "currentUserFirstName")
            UserDefaults.standard.removeObject(forKey: "currentUserLastName")
            self.isSignedIn = false
        }
        catch {
            print("Cannot sign out")
        }
    }
    
    /// Delete every data related to the current user (their account, posts and model in Firebase Database.)
    public func deleteCurrentUserData() {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        Database.database().reference().child("User \(safeEmail)_\(currentUserID)").removeValue()
        
        Firestore.firestore().collection("User \(safeEmail)_\(currentUserID)").document().delete()
        
        signOutUser()
        
        Auth.auth().currentUser?.delete { error in
            guard error == nil else {
                print("(Auth) Cannot delete user account")
                return
            }
            
            print("(Auth) Successfully deleted user account")
        }
    }
}
