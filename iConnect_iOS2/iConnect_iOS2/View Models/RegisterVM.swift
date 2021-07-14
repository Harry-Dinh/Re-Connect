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
    @Published var showDetailRegistration: Bool = false
    @Published var showAccountDeletionAlert: Bool = false
    
    // Secondary Info
    @Published var dateOfBirth: Date = Date()
    @Published var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @Published var genderPicker: Int = 0
    @Published var genderPickerMessage: String = "Your age and gender will be used to hide age-unappropriate posts from you. iConnect never collect nor sell these data for advertising."
    
    // Profile
    @Published var isPrivateAccount: Bool = true
    @Published var privateAccountMessage: String = "Private Account hides your posts and media from the public, people must send you a request to follow you.\n\nPublic Account show your posts and media to the public, people can follow you without sending a request.\n\nFor regular individuals, setting your account private is recommended. People like celebrities and important figures can set their account to public."
    @Published var username: String = ""
    @Published var learnMorePrivateAccount: Bool = false
    @Published var learnMoreUsername: Bool = false
    @Published var usernameMessage: String = "Your username is used to identify you on iConnect and people can find it to follow you. It can also be used for followers to tag you in their posts. However, you can disable tagging in Settings."
    
    // Preferences
    @Published var allowDiagnostic: Bool = true
    
    private var databaseRef = Database.database().reference()
    
    public func createUserAccount(firstName: String, lastName: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            print("Successfully created user account")
            self?.createUserObject(firstName: firstName, lastName: lastName)
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
        
        UserDefaults.standard.set(firstName, forKey: "currentUserFirstName")
        UserDefaults.standard.set(lastName, forKey: "currentUserLastName")
    }
    
    /// This function will be used after the user account has been created.
    // Note: Add more parameters if desired!
    public func updateUserObject(dateOfBirth: String, isPrivateAccount: Bool, gender: Int, allowDiagnostic: Bool) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            print("Cannot fetch user's data")
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = [
            "date_of_birth": dateOfBirth as String,
            "is_private_account": isPrivateAccount as Bool,
            "gender": gender as Int,
            "allow_diagnostic": allowDiagnostic as Bool
        ]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(currentUserID)").updateChildValues(updatedValues)
        print("Successfully updated user preferences and data")
    }
    
    /// Update the date of birth and the gender of the user. Note: `dob` stands for `date of birth`
    public func updateBasicInfo(dob: Date, gender: Int) {
        let dobString = dateFormatter.string(from: dob)
        
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            print("Cannot fetch user's data")
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = ["date_of_birth": dobString, "gender": gender]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(currentUserID)").updateChildValues(updatedValues)
        print("Successfully update date of birth")
    }
    
    public func updateDiagnosticPreferences(allowDiagnostic: Bool) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            print("Cannot fetch user's data")
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = ["allow_diagnostic": allowDiagnostic]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(currentUserID)").updateChildValues(updatedValues)
    }
    
    public func setupProfileDetails(username: String, isPrivateAccount: Bool) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            print("Cannot fetch user's data")
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = ["username": username, "is_private_account": isPrivateAccount]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(currentUserID)").updateChildValues(updatedValues)
    }
}
