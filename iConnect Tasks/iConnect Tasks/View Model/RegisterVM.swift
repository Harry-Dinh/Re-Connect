//
//  RegisterVM.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI
import Firebase

class RegisterVM: ObservableObject {
    static let shared = RegisterVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var firstNameField: String = ""
    @Published var lastNameField: String = ""
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    // MARK: - References
    
    private var database = Database.database().reference()
    private var firestore = Firestore.firestore()
    
    // MARK: - User
    
    public func createUserAccount(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            guard error == nil else {
                print("cannot create user account, error: \(error!.localizedDescription)")
                return
            }
            
            let firstName = self?.firstNameField
            let lastName = self?.lastNameField
            let email = self?.emailField
            
            self?.createUserModel(firstName: firstName!, lastName: lastName!, email: email!)
            print("Successfully create user")
            self?.isSignedIn = true
        }
    }
    
    public func createUserModel(firstName: String, lastName: String, email: String) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = ExtensionMethods.shared.convertToSafeEmail(email: email)
        
        let userObject: [String: Any] = [
            "firstName": firstName as NSObject,
            "lastName": lastName as NSObject,
            "email": safeEmail as NSObject,
            "uid": currentUserID as NSObject
        ]
        
        database.child("Users").child("user \(safeEmail)_\(currentUserID)").setValue(userObject)
    }
}
