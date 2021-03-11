//
//  RegisterVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Firebase
import SwiftUI

class RegisterVM: ObservableObject {
    
    static let shared = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
    
    public func registerUserAccount(completion: @escaping () -> Void) {
        let email = emailField
        let password = passwordField
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                print("Failed to create user with email: \(email)")
                return
            }
            
            completion()
        }
    }
}
