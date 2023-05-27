//
//  LoginScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

class LoginScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = LoginScreenVM()
    
    private let databaseReference = Database.database().reference()
    
    /// The `UserDefaults` (UD) ID to decode the data of the logged in user from `UserDefaults`.
    public static let loggedInUserUDID = "loggedInUser"
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    /// A boolean that checks for if there is a user cached on the device and choose to present the login screen or core screen.
    @AppStorage("isSignedIn") var isSignedIn = false
    
    /// The current logged in user that is cached on this device.
    @Published var loggedInUser: RECUser?
    
    /// The email field
    @Published var emailField: String = ""
    
    /// The password field
    @Published var passwordField: String = ""
    
    /// A binding boolean to present the registration screen.
    @Published var presentRegisterScreen = false
    
    // MARK: - ERROR ALERTS
    
    @Published var emailNotValidAlert = false
    
    @Published var failedToSignInUser = false
    
    /// This triggers an alert when the `readLoggedInUser()` method failed to read the values from the logged in user from `UserDefaults`.
    @Published var failedToUnwrapUserInfo = false
    
    /// This triggers an alert when the `cacheLoggedInUser()` method failed to encode the user data to `UserDefaults`.
    @Published var failedToEncodeUser = false
    
    /// This triggers an alert when the `readLoggedInUser()` method failed to decode the user from the data unwrapped beforehand.
    @Published var failedToDecodeUser = false
    
    /// This triggers an alert when the `signOutUser()` method failed to sign out the current logged in user.
    @Published var failedToSignOut = false
    
    // MARK: - FUNCTIONS
    
    /// Convert the data of the `loggedInUser` variable into binary data and store locally on the device using `UserDefaults`.
    public func cacheLoggedInUser() {
        do {
            let encoder = JSONEncoder()
            let userData = try encoder.encode(loggedInUser)
            
            UserDefaults.standard.set(userData, forKey: LoginScreenVM.loggedInUserUDID)
        } catch {
            self.failedToEncodeUser.toggle()
        }
    }
    
    /// Read the data saved by `cacheLoggedInUser()` and convert it back to a `RECUser` object and assign it back to `loggedInUser`.
    public func readLoggedInUser() {
        guard let userData = UserDefaults.standard.value(forKey: LoginScreenVM.loggedInUserUDID) as? Data else {
            self.failedToUnwrapUserInfo.toggle()
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(RECUser.self, from: userData)
            self.loggedInUser = user
        } catch {
            self.failedToDecodeUser.toggle()
        }
    }
    
    public func signOutUser() {
        do {
            UserDefaults.standard.removeObject(forKey: LoginScreenVM.loggedInUserUDID)
            try Auth.auth().signOut()
            self.isSignedIn = false
        } catch {
            self.failedToSignOut.toggle()
        }
    }
}
