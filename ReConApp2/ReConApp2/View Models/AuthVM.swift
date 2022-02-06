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
    let firestoreRef = Firestore.firestore()
    
    // MARK: - ENUMERATIONS
    enum AuthFields: Hashable {
        case firstName
        case lastName
        case email
        case password
    }
    
    // MARK: - FIELDS
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: - SWIFTUI
    @Published var showRegisterView: Bool = false
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    // MARK: - METHODS
    
    public func insertUser(user: ReConUser) {
        let path = firestoreRef.collection("ReConUsers").document()
        let userData: [String: Any] = [
            "firstName": user.firstName,
            "lastName": user.lastName,
            "email": user.email,
            "bio": user.bio,
            "age": user.age,
            "gender": user.gender,
            "followers": user.followerCount,
            "followings": user.followingCount
        ]
        
        path.collection("Info").addDocument(data: userData)
    }
    
    // MARK: - STATIC METHODS
    
    public static func createAccount(firstName: String, lastName: String, email: String, password: String) {
        // Create account on Firebase Auth
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            guard error == nil else {
                print("Cannot create user account")
                return
            }
            
            let user = ReConUser(firstName: firstName, lastName: lastName, email: email, bio: "", age: 0, gender: -1, followerCount: 0, followingCount: 0)
            AuthVM.shared.insertUser(user: user)
        }
    }
}
