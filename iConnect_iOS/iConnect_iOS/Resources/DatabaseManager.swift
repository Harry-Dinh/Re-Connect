//
//  DatabaseManager.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-21.
//

import FirebaseDatabase
import FirebaseAuth

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var database = Database.database().reference()
    
    private var databaseHandle: DatabaseHandle?
    
    private init() {}
    
    // MARK: - User
    
    /// Create a user object with a `firstName`, `lastName`, `email` and `password` on Firebase Realtime Database.
    public func createUserObject(firstName: String, lastName: String, email: String) {
        
        guard email.contains(".") else {
            return
        }
        
        let safeEmail = email.replacingOccurrences(of: ".", with: "-")
        guard let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let userObject: [String: Any] = [
            "uid": currentUserID as NSObject,
            "email": safeEmail as NSObject,
            "first_name": firstName as NSObject,
            "last_name": lastName as NSObject
        ]
        
        database.child("Users").child("user \(safeEmail)_with_id_\(currentUserID)").setValue(userObject)
        
        print("Successfully created user object with email: \(safeEmail)")
    }
    
    /// Cache the registered user data to `UserDefaults` and save them locally on device.
    public func cacheUserDataToUserDefaults(firstName: String, lastName: String, email: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(firstName, forKey: "user_first_name")
        defaults.set(lastName, forKey: "user_last_name")
        defaults.set(email, forKey: "user_profile_email")
        
        print("Successfully cached to UserDefaults")
    }
}
