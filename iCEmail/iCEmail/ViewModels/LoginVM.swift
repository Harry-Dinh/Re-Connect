//
//  LoginVM.swift
//  iCEmail
//
//  Created by Harry Dinh on 2021-03-24.
//

import SwiftUI
import Firebase

class LoginVM: ObservableObject {
    static let shared = LoginVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField = ""
    @Published var passwordField = ""
    @Published var showRegisterScreen = false
    
    public func signInWithCurrentUser() {
        Auth.auth().signIn(withEmail: emailField, password: passwordField) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            self?.isSignedIn = true
            print("Succesfully signed in user")
        }
    }
    
    public func signOutUser() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Cannot sign out user, error: \(error.localizedDescription)")
        }
    }
}
