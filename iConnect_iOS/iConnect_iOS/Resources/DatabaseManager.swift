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
    
    private init() {}
    
    // MARK: - User
    
    /// Create a user object with a `firstName`, `lastName`, `email` and `password` on Firebase Realtime Database.
    public func createUserObject(firstName: String, lastName: String, email: String) {
        
        let safeEmail = convertToSafeEmail(with: email)
        
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
        
        print("Successfully created user object and cached to UserDefaults with email: \(email)")
    }
    
    /// Check an email address to see whether a period `.` exist. If it exists, the method will replace it with a dash to prevent crashing when writing to database.
    public func convertToSafeEmail(with email: String) -> String {
        var safeEmail: String = ""
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
    
    /// Cache the registered user data to `UserDefaults` and save them locally on device.
    public func cacheUserDataToUserDefaults(firstName: String, lastName: String, email: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(firstName, forKey: "user_first_name")
        defaults.set(lastName, forKey: "user_last_name")
        defaults.set(email, forKey: "user_profile_email")
        
        print("Successfully cached to UserDefaults")
    }
    
    public func clearCachedDataFromUserDefaults() {
        let defaults = UserDefaults.standard
        
        defaults.set("", forKey: "user_first_name")
        defaults.set("", forKey: "user_last_name")
        defaults.set("", forKey: "user_profile_email")
        
        print("Successfully cleared all cached data")
    }
}
