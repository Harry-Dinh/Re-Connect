//
//  AuthVM.swift
//  iConnect
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI
import Firebase

class AuthVM: ObservableObject {
    static let shared = AuthVM()
    
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    // MARK: - Login
    @Published var loginEmailField: String = ""
    @Published var loginPasswordField: String = ""
    @Published var showRegister: Bool = false
    
    public func signInCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            print("Successfully signed in")
            
            withAnimation {
                self?.isSignedIn = true
            }
        }
    }
    
    public func signOutCurrentUser() {
        do {
            try Auth.auth().signOut()
            
            withAnimation {
                self.isSignedIn = false
            }
        }
        catch {
            print("Cannot sign out user, error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Register
    @Published var firstNameField: String = ""
    @Published var lastNameField: String = ""
    @Published var registerEmailField: String = ""
    @Published var registerPasswordField: String = ""
    
    public func registerUserAccount(firstName: String, lastName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot register user")
                return
            }
            
            print("successfully create account")
            
            withAnimation {
                self?.isSignedIn = true
            }
        }
    }
}
