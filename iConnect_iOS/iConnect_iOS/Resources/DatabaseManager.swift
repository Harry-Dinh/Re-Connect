//
//  DatabaseManager.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-21.
//

import SwiftUI
import Firebase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private var database = Database.database().reference()
    private var firestore = Firestore.firestore()
    
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
        
        database.child("Users").child("user \(safeEmail)_\(currentUserID)").setValue(userObject)
        cacheUserDataToUserDefaults(firstName: firstName, lastName: lastName, email: email)
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
        
        defaults.set(firstName, forKey: "first_name")
        defaults.set(lastName, forKey: "last_name")
        defaults.set(email, forKey: "profile_email")
        
        print("Successfully cached to UserDefaults")
    }
    
    public func clearCachedDataFromUserDefaults() {
        let defaults = UserDefaults.standard
        
        defaults.set("", forKey: "first_name")
        defaults.set("", forKey: "last_name")
        defaults.set("", forKey: "profile_email")
        
        print("Successfully cleared all cached data")
    }
    
    // MARK: - Post
    
    /// Write a text post to Firestore.
    public func writeTextPostToFirestore(body: String, title: String, date: String, uuid: String, liked: Bool) {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = convertToSafeEmail(with: email)
        
        let postObject: [String: Any] = [
            "body": body as NSObject,
            "title": title as NSObject,
            "date": date as NSObject,
            "uuid": uuid as NSObject,
            "liked": liked as NSObject
        ]
        
        firestore.collection("User \(safeEmail)_\(currentUserID)").document(uuid).setData(postObject) { (error) in
            guard error == nil else {
                print("Cannot write post data to Firestore, error: \(error!.localizedDescription)")
                return
            }
            
            print("Successfully write post data to Firestore")
        }
    }
    
    public func numberOfPostOnFirestore() {
        let email = Auth.auth().currentUser?.email
        let currentUserID = Auth.auth().currentUser?.uid
        
        let safeEmail = DatabaseManager.shared.convertToSafeEmail(with: email!)
        
        firestore.collection("User \(safeEmail)_\(currentUserID!)").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            }
            else {
                for document in snapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}
