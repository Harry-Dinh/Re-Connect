//
//  AuthVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI
import FirebaseAuth

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
            self.isSignedIn = false
        }
        catch {
            print("Cannot sign out")
        }
    }
}
