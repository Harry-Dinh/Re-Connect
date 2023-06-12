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
    
    enum FocusField: Hashable {
        case email
        case password
    }
    
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
    
    /// This alert is shown when the user tapped the log out button.
    @Published var logOutUserAlert = false
    
    // MARK: - ERROR ALERTS
    
    /// This triggers an alert when the `signIn()` method detects no "@" sign in the email parameter provided.
    @Published var emailNotValidAlert = false
    
    /// This triggers an alert when the `signIn()` method failed to sign in the user using Firebase Auth API.
    @Published var failedToSignInUser = false
    
    /// This triggers an alert when the `fetchUserDataFromFirebase()` method failed to fetch the data with the given uid path.
    @Published var failedToFetchUserData = false
    
    /// This triggers an alert when the `readLoggedInUser()` method failed to read the values from the logged in user from `UserDefaults`.
    @Published var failedToUnwrapUserInfo = false
    
    /// This triggers an alert when the `cacheLoggedInUser()` method failed to encode the user data to `UserDefaults`.
    @Published var failedToEncodeUser = false
    
    /// This triggers an alert when the `readLoggedInUser()` method failed to decode the user from the data unwrapped beforehand.
    @Published var failedToDecodeUser = false
    
    /// This triggers an alert when the `signOutUser()` method failed to sign out the current logged in user.
    @Published var failedToSignOut = false
    
    // MARK: - FUNCTIONS
    
    /// Log in using Firebase Auth API with the given `email` and `password` parameters.
    /// - Parameters:
    ///   - email: The email to sign in with (has to be verified before used to log in.
    ///   - password: The protected password for the user's account for further verification.
    public func login(with email: String, and password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let result = authResult, error == nil else {
                self?.failedToSignInUser.toggle()
                return
            }
            
            let firebaseUID = result.user.uid
            self?.fetchUserDataFromDatabase(with: firebaseUID)
        }
    }
    
    /// Fetch the user's data from the given Firebase Auth UID (unique identifier) and assign those values to `loggedInUser`.
    /// - Parameter uid: The user's UID to look for in the database.
    public func fetchUserDataFromDatabase(with uid: String) {
        databaseReference.child(RECDatabaseParentPath.users).child(uid).getData { [weak self] error, snapshot in
            guard let value = snapshot?.value as? NSDictionary, error == nil else {
                self?.failedToFetchUserData.toggle()
                return
            }
            
            // Assign values to loggedInUser
            
            let age = value[RECUser.Property.age] as? Int ?? RECUser.placeholderUser.age
            let displayName = value[RECUser.Property.displayName] as? String ?? RECUser.placeholderUser.displayName
            let email = value[RECUser.Property.emailAddress] as? String ?? RECUser.placeholderUser.emailAddress
            let followerCount = value[RECUser.Property.followerCount] as? Int ?? RECUser.placeholderUser.followerCount
            let followingCount = value[RECUser.Property.followingCount] as? Int ?? RECUser.placeholderUser.followingCount
            let isProtectedAccount = value[RECUser.Property.isProtectedAccount] as? Bool ?? RECUser.placeholderUser.isProtectedAccount
            let reconnectUID = value[RECUser.Property.uid] as? String ?? RECUser.placeholderUser.getUID()
            let username = value[RECUser.Property.username] as? String ?? RECUser.placeholderUser.username
            let pfpURL = value[RECUser.Property.pfpURL] as? String ?? RECUser.placeholderUser.pfpURL
            
            self?.loggedInUser = RECUser(uid: reconnectUID,
                                         firebaseUID: uid,
                                         displayName: displayName,
                                         username: username,
                                         emailAddress: email,
                                         pfpURL: pfpURL,
                                         age: age,
                                         isProtectedAccount: isProtectedAccount)
            
            self?.loggedInUser?.followerCount = followerCount
            self?.loggedInUser?.followingCount = followingCount
            
            // Cache loggedInUser
            
            self?.cacheLoggedInUser()
            EditProfileScreenVM.viewModel.fetchProfileCustomizationData(from: self?.loggedInUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
            self?.isSignedIn = true
        }
    }
    
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
