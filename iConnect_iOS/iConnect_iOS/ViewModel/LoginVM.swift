//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI
import UIKit
import FirebaseAuth

class LoginVM: ObservableObject {
    
    static let shared = LoginVM()
    
    private init() {}
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    @Published var showRegisterScreen: Bool = false
    
    public func signInWithCurrentUser() {
        let email = emailField
        let password = passwordField
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("Cannot sign user in")
                
                let alert = UIAlertController(title: "Error Title", message: "Error Message", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            
            self?.isSignedIn = true
            print("Successfully signed user in")
        }
    }
}
