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
    private var firestoreRef = Firestore.firestore()
    
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
            
            let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
            
            print("Sucessfully created user account")
            if !middleName.isEmpty {
                self?.createUserObject(fullName: "\(firstName) \(middleName) \(lastName)", email: email)
                self?.createUserObjectOnDatabase(fullName: "\(firstName) \(middleName) \(lastName)", email: safeEmail)
            }
            else {
                self?.createUserObject(fullName: "\(firstName) \(lastName)", email: email)
                self?.createUserObjectOnDatabase(fullName: "\(firstName) \(lastName)", email: safeEmail)
            }
            
            self?.firstName = ""
            self?.middleName = ""
            self?.lastName = ""
            self?.email = ""
            self?.password = ""
        }
    }
    
    public func createUserObjectOnDatabase(fullName: String, email: String) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let path = databaseRef.child("Users").child(uid)
        let dobString = HelperMethods.shared.dateFormatter.string(from: dateOfBirth)
        let userData: [String: Any] = [
            "fullName": fullName,
            "email": email,
            "uid": uid,
            "dateOfBirth": dobString,
            "gender": gender,
            "allowDiagnosticCollection": allowDiagnosticCollection,
            "isPrivateAccount": isPrivateAccount,
            "username": username
        ]
        
        path.setValue(userData)
    }
    
    /// Create the user's object on Firestore (call this after create everything!)
    public func createUserObject(fullName: String, email: String) {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let path = firestoreRef.collection("users")
        let dobString = HelperMethods.shared.dateFormatter.string(from: dateOfBirth)
        let userData: [String: Any] = [
            "fullName": fullName,
            "email": email,
            "uid": uid,
            "dateOfBirth": dobString,
            "gender": gender,
            "allowDiagnosticCollection": allowDiagnosticCollection,
            "isPrivateAccount": isPrivateAccount,
            "username": username
        ]
        
        path.addDocument(data: userData)
    }
    
    public func updateUserInfo(dateOfBirth: Date, gender: Int) {
        self.dateOfBirth = dateOfBirth
        self.gender = gender
    }
    
    public func updateUserProfileInfo(username: String, isPrivateAccount: Bool, allowDiagnosticCollection: Bool) {
        self.allowDiagnosticCollection = allowDiagnosticCollection
        self.isPrivateAccount = isPrivateAccount
        self.username = username
    }
    
    public func getAllUsers(completion: @escaping (Result<[[String: String]], Error>) -> Void) {
        databaseRef.child("User nodes").observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [[String: String]] else {
                completion(.failure(FetchErrors.failedToFetch))
                return
            }
            
            completion(.success(value))
        }
    }
    
    public enum FetchErrors: Error {
        case failedToFetch
    }
}
