//
//  RegisterVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import Foundation
import SwiftUI
import Firebase

class RegisterVM: ObservableObject {
    static let shared = RegisterVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    // MARK: - FIREBASE PROPERTIES
    private var databaseRef = Database.database().reference()
    
    // MARK: - SWIFTUI STATES
    @Published var isTextFieldEditing: Bool = false
    
    // MARK: - USER PROPERTIES
    // MARK: Basic Info
    @Published var firstName: String = ""
    @Published var middleName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var dateOfBirth: Date = Date()
    @Published var username: String = ""
    @Published var gender: Int = 0
    
    // MARK: Profile Settings
    @Published var isPrivateAccount: Bool = false
    @Published var allowDiagnosticCollection: Bool = false
    
    // MARK: - USER METHODS
    public func createUserAccount(firstName: String, middleName: String, lastName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            print("Sucessfully created user account")
            self?.createUserObject(firstName: firstName, middleName: middleName, lastName: lastName, email: email)
        }
    }
    
    public func createUserObject(firstName: String, middleName: String, lastName: String, email: String) {
        UserDefaults.standard.set(firstName, forKey: "firstName")
        UserDefaults.standard.set(middleName, forKey: "middleName")
        UserDefaults.standard.set(lastName, forKey: "lastName")
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        let userInfo: [String: Any] = [
            "firstName": firstName,
            "middleName": middleName,
            "lastName": lastName,
            "email": safeEmail,
            "uid": uid
        ]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(uid)").child("User Info").setValue(userInfo)
    }
}
