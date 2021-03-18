//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import FirebaseAuth

class LoginVM: ObservableObject {
    
    static let shared = LoginVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    public func signInWithCurrentUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            self?.isSignedIn = true
            print("Successfully signed user in")
        }
    }
}
