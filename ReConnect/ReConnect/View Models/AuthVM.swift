//
//  AuthVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-11-14.
//

import Foundation
import SwiftUI
import Firebase

class AuthVM: ObservableObject {
    static let shared = AuthVM()
    
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    private let database = Database.database().reference()
    private let auth = Auth.auth()
    
    // MARK: - Register View
    @Published var registerEmail: String = ""
    @Published var registerPassword: String = ""
    @Published var registerFullName: String = ""
    
    // MARK: - Login View
    @Published var loginEmail: String = ""
    @Published var loginPassword: String = ""
    
    public func registerAccount(fullName: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Failed to create user account")
                return
            }
            print("Successfully create user account")
        }
    }
    
    public func signInUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot sign in user")
                return
            }
            print("Successfully signed in")
            self?.isSignedIn = true
        }
    }
}
