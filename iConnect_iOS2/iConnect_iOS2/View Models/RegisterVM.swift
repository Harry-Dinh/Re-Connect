//
//  RegisterVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

class RegisterVM: ObservableObject {
    static let shared = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var firstNameField: String = ""
    @Published var lastNameField: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    private var databaseRef = Database.database().reference()
    
    public func createUserAccount(firstName: String, lastName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            print("Successfully created user account")
            self?.createUserObject(firstName: firstName, lastName: lastName)
            self?.isSignedIn = true
        }
    }
    
    public func createUserObject(firstName: String, lastName: String) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let userObject: [String: Any] = [
            "first_name": firstName,
            "last_name": lastName,
            "email": safeEmail,
            "uid": currentUserID
        ]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(currentUserID)").setValue(userObject)
    }
}
