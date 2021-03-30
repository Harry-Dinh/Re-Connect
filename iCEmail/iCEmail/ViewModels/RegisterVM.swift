//
//  RegisterVM.swift
//  iCEmail
//
//  Created by Harry Dinh on 2021-03-24.
//

import SwiftUI
import Firebase

class RegisterVM: ObservableObject {
    static let shared = RegisterVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
    
    public func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot create user with email: \(email)")
                return
            }
            
            self?.isSignedIn = true
            print("Successfully created user")
        }
    }
}
