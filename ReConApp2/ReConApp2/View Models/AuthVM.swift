//
//  AuthVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-05.
//

import Foundation
import Firebase
import SwiftUI

class AuthVM: ObservableObject {
    static let shared = AuthVM()
    
    // MARK: - FIREBASE & OTHER FRAMEWORKS
    let databaseRef = Database.database().reference()
    
    // MARK: - ENUMERATIONS
    enum AuthFields: Hashable {
        case firstName
        case lastName
        case username
        case email
        case password
    }
    
    // MARK: - FIELDS
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: - SWIFTUI
    @Published var showRegisterView: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    // MARK: - METHODS
    
    public func insertUser(user: ReConUser) {
        let path = databaseRef.child("ReConUsers").childByAutoId()
        let userData: [String: Any] = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            "username": user.username,
            "email": user.email,
            "bio": user.bio,
            "age": user.age,
            "gender": user.gender,
            "followers": user.followerCount,
            "followings": user.followingCount
        ]
        
        path.child("Info").setValue(userData)
    }
    
    // MARK: - STATIC METHODS
    
    public static func createAccount(firstName: String, lastName: String, username: String, email: String, password: String) {
        // Create account on Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            let user = ReConUser(firstName: firstName, lastName: lastName, username: username, email: email, bio: "", age: 0, gender: -1, followerCount: 0, followingCount: 0)
            AuthVM.shared.insertUser(user: user)
            AuthVM.shared.presentationMode.wrappedValue.dismiss()
            AuthVM.shared.isSignedIn = true
        }
    }
    
    public static func signOut() {
        do {
            try Auth.auth().signOut()
            AuthVM.shared.isSignedIn = false
        }
        catch {
            debugPrint("Cannot sign out the user")
        }
    }
}
