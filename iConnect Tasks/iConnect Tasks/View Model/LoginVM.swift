//
//  LoginVM.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI
import Firebase

class LoginVM: ObservableObject {
    static let shared = LoginVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var showRegister: Bool = false
    
    public func signInAsCurrentUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                return
            }
            
            print("Succesfully signed in user")
            self?.isSignedIn = true
        }
    }
    
    public func signOut() {
        do {
            try Auth.auth().signOut()
            print("Successfully signed user out")
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
