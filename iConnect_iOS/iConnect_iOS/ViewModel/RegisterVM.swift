//
//  RegisterVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import FirebaseAuth

class RegisterVM: ObservableObject {
    
    static let shared = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    public func registerUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot create user with email: \(email)")
                return
            }
            
            self?.isSignedIn = true
            
            guard let firstName = self?.firstName,
                  let lastName = self?.lastName,
                  let email = self?.emailField else {
                return
            }
            
            DatabaseManager.shared.createUserObject(firstName: firstName, lastName: lastName, email: email)
            print("Successfully created user")
        }
    }
}
