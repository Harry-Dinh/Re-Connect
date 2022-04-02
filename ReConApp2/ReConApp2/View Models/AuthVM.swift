//
//  AuthVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-05.
//

import Foundation
import Firebase
import SwiftUI

/// A class that handles every authentication–related tasks in the app.
class AuthVM: ObservableObject {
    
    /// A shared instance of the object
    static let shared = AuthVM()
    
    // MARK: - FIREBASE & OTHER FRAMEWORKS
    
    /// A reference to Firebase Database
    private let databaseRef = Database.database().reference()
    
    // MARK: - ENUMERATIONS
    
    /// A set of enums that attached to each text field to indicate what field is currently in focus.
    enum AuthFields: Hashable {
        case firstName
        case lastName
        case username
        case email
        case password
    }
    
    // MARK: - FIELDS
    
    /// A placeholder string for the user's first name
    @Published var firstName: String = ""
    
    /// A placeholder string for the user's last name
    @Published var lastName: String = ""
    
    /// A placeholder string for the user's username
    @Published var username: String = ""
    
    /// A placeholder string for the user's email address
    @Published var email: String = ""
    
    /// A placeholder string for the user's password (NOTE: This variable is not protected)
    @Published var password: String = ""
    
    // MARK: - SWIFTUI
    @Published var showRegisterView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    // MARK: - METHODS
    
    /// Create a node of a user in Firebase Database when the user is created.
    /// - Parameter user: A `ReConUser` object containing the information to be inserted into the node.
    public func insertUser(user: ReConUser) {
        let path = databaseRef.child("ReConUsers").child("\(AuthVM.getUID()!)")
        let userData: [String: Any] = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            "username": user.username,
            "email": user.email,
            "bio": user.bio,
            "age": user.age,
            "gender": user.gender,
            "followers": user.followerCount,
            "followings": user.followingCount,
            "firebase_uid": AuthVM.getUID()!
        ]
        
        path.setValue(userData)
    }
    
    // MARK: - CLASS METHODS
    
    /// Sign in the user with the provided email and password using Firebase Auth API.
    /// - Parameters:
    ///   - email: The user's email
    ///   - password: The user's password (NOTE: This variable is not protected)
    public static func signInUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Cannot sign in user")
                return
            }
            
            AuthVM.shared.isSignedIn = true
            AuthVM.shared.presentationMode.wrappedValue.dismiss()
        }
    }
    
    /// Create a user account using Firebase Auth API then call the `insertUser(user: ReConUser)` method.
    /// - Parameters:
    ///   - firstName: The user's first name
    ///   - lastName: The user's last name
    ///   - username: The user's username
    ///   - email: The user's email address
    ///   - password: The user's password for the account creation process (will not be saved in the Database)
    public static func createAccount(firstName: String, lastName: String, username: String, email: String, password: String) {
        // Create account on Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            let uid = result?.user.uid
            
            let user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: "", age: 0, gender: -1, followerCount: 0, followingCount: 0, firebaseUID: uid!, profilePicURL: nil, isPrivateAccount: false)
            AuthVM.shared.insertUser(user: user)
            AuthVM.shared.presentationMode.wrappedValue.dismiss()
            AuthVM.shared.isSignedIn = true
        }
    }
    
    /// Sign out the current user along with clearing any data that is associated with that user.
    public static func signOut() {
        do {
            try Auth.auth().signOut()
            
            UserDefaults.standard.set(nil, forKey: "currentUser")
            print("Successfully cleared current user info")
            
            AuthVM.shared.isSignedIn = false
            print("Successfully signed out")
        }
        catch {
            debugPrint("Cannot sign out the user")
        }
    }
    
    /// Get the current user Firebase UID
    /// - Returns: The current user's Firebase UID
    public static func getUID() -> String? {
        return Auth.auth().currentUser?.uid
    }
}
