//
//  LoginVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import Foundation
import Firebase
import SwiftUI

class LoginVM: ObservableObject {
    static let shared = LoginVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    // MARK: - User Properties
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: - User Methods
    public func signInCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Cannot sign in user")
                return
            }
            
            print("Successfully signed in.")
        }
    }
}
