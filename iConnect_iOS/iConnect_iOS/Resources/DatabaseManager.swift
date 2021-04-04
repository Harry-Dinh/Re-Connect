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
    
    // MARK: - Post
    
    /// This method write a post (without an image URL) JSON model to the database.
    public func writeTextPostToDatabase(with title: String?, and body: String, date: Date) {
        guard let userEmail = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = convertToSafeEmail(with: userEmail)
        
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .long
            return formatter
        }()
        
        let stringDate = dateFormatter.string(from: date)
        var safeStringDate = ""
        
        if stringDate.contains(",") && stringDate.contains(":") {
            safeStringDate = stringDate.replacingOccurrences(of: ":", with: "-")
        }
        
        let identifier = UUID()
        
        let userPosts: [String: Any] = [
            "title": title! as NSObject,
            "body": body as NSObject,
            "uuid": identifier.uuidString as NSObject,
            "date": safeStringDate as NSObject
        ]
        
        database.child("Users").child("user \(safeEmail)_with_id_\(currentUserID)").child("posts").setValue(userPosts)
        print("Successfully write post data to Database")
    }
    
    public func downloadUserPostData() {
        guard let email = Auth.auth().currentUser?.email,
              let userUID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = convertToSafeEmail(with: email)
        
        database.child("Users").child("user \(safeEmail)_with_id_\(userUID)").child("posts").observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            
            guard let title = value!["title"] as? String,
                  let body = value!["body"] as? String,
                  let uuid = value!["uuid"] as? String,
                  let date = value!["date"] as? String else {
                return
            }
            
            var model = [PostModel]()
            
            model.append(PostModel(body: body, date: date, title: title, uuid: uuid))
        }
    }
}
