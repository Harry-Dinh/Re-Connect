//
//  DatabaseManager.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-21.
//

import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var database = Database.database().reference()
    
    private init() {}
    
    /// Create a user object with a `firstName`, `lastName`, `email` and `password` on Firebase Realtime Database.
    public func createUserObject(firstName: String, lastName: String, email: String) {
        
        guard email.contains(".") else {
            return
        }
        
        let safeEmail = email.replacingOccurrences(of: ".", with: "-")
        
        database.child("user \(safeEmail)").setValue([
            "first_name": firstName,
            "last_name": lastName,
            "email": safeEmail
        ])
    }
}
