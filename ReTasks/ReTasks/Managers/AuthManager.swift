//
//  AuthManager.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation
import SwiftUI
import FirebaseAuth

/// A manager that handles everything related to account authentication using the Firebase API.
class AuthManager: ObservableObject {
    
    /// A shared instance of `AuthManager`.
    public static let shared = AuthManager()
    
    // MARK: - CONSTANTS
    
    public static let CURRENT_USER_KEY = "CURRENT_USER_KEY"
    
    // MARK: - SWIFTUI STATE OBJECTS
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var currentUser = RETUser()
    
    @Published var failedToSignInAlert = false
    @Published var failedToCreateAccount = false
    
    // MARK: - FUNCTIONS
    
    public func signIn(with email: String, and password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let authResult = authResult,
                  error == nil else {
                print("Cannot sign in with current credentials")
                self?.failedToSignInAlert.toggle()
                return
            }
            
            self?.currentUser = RETUser(emailAddress: email, firebaseUID: authResult.user.uid)
            self?.encodeUser()
            self?.isSignedIn = true
        }
    }
    
    public func createAccount(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let authResult = authResult,
                  error == nil else {
                print("Cannot create account with current credentials")
                self?.failedToCreateAccount.toggle()
                return
            }
            
            self?.currentUser = RETUser(emailAddress: email, firebaseUID: authResult.user.uid)
            self?.encodeUser()
            self?.isSignedIn = true
        }
    }
    
    public func encodeUser() {
        let encoder = JSONEncoder()
        let encodedUserData: Data
        
        do {
            encodedUserData = try encoder.encode(currentUser)
            UserDefaults.standard.set(encodedUserData, forKey: AuthManager.CURRENT_USER_KEY)
        } catch {
            print("Cannot encode user")
        }
    }
    
    public func decodeUser() {
        let decoder = JSONDecoder()
        
        guard let userData = UserDefaults.standard.value(forKey: AuthManager.CURRENT_USER_KEY) as? Data else {
            currentUser = RETUser()
            return
        }
        
        do {
            currentUser = try decoder.decode(RETUser.self, from: userData)
        } catch {
            print("Cannot encode user")
            currentUser = RETUser()
        }
    }
}
