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
    
    public func signInWithCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            print("Successfully signed in")
            self?.isSignedIn = true
        }
    }
    
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
