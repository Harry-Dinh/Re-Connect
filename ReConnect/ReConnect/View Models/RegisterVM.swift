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
            let userModel = UserModel(firstName: firstName, middleName: middleName, lastName: lastName, email: email)
            self?.createUserObject(user: userModel)
            
            self?.firstName = ""
            self?.middleName = ""
            self?.lastName = ""
            self?.email = ""
            self?.password = ""
        }
    }
    
    public func createUserObject(user: UserModel) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: user.email)
        
        let userInfo: [String: Any] = [
            "firstName": user.firstName,
            "middleName": user.middleName,
            "lastName": user.lastName,
            "email": safeEmail,
            "uid": uid
        ]
        
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").setValue(userInfo)
        
        // Create user node
        databaseRef.child("User nodes").observeSingleEvent(of: .value) { [weak self] snapshot in
            if var usersCollection = snapshot.value as? [[String: String]] {
                let newElement = [
                    "firstName": user.firstName,
                    "middleName": user.middleName,
                    "lastName": user.lastName,
                    "email": safeEmail
                ]
                
                usersCollection.append(newElement)
                
                self?.databaseRef.child("User nodes").setValue(usersCollection, withCompletionBlock: { error, _ in
                    guard error == nil else {
                        print("Cannot set user's data")
                        return
                    }
                    
                    print("Successfully set users data")
                })
            }
            else {
                let newCollection: [[String: String]] = [
                    [
                        "firstName": user.firstName,
                        "middleName": user.middleName,
                        "lastName": user.lastName,
                        "email": safeEmail
                    ]
                ]
                
                self?.databaseRef.child("User nodes").setValue(newCollection, withCompletionBlock: { error, _ in
                    guard error == nil else {
                        print("Cannot set user's data")
                        return
                    }
                    
                    print("Successfully set user's data")
                })
            }
        }
    }
    
    public func updateUserInfo(dateOfBirth: Date, gender: Int) {
        
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        let dobString = HelperMethods.shared.dateFormatter.string(from: dateOfBirth)
        
        let updatedValues: [String: Any] = [
            "dateOfBirth": dobString,
            "gender": gender
        ]
        
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").updateChildValues(updatedValues)
    }
    
    public func updateUserProfileInfo(username: String, isPrivateAccount: Bool, allowDiagnosticCollection: Bool) {
        
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = [
            "username": username,
            "isPrivateAccount": isPrivateAccount,
            "allowDiagnosticCollection": allowDiagnosticCollection
        ]
        
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").updateChildValues(updatedValues)
        databaseRef.child("User nodes").child("\(0...)")
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
