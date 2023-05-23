//
//  RECUser.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import Foundation

struct RECUser: Codable {
    /// The identifier that is unique to this user. This cannot be changed once initialized.
    private let uid: String
    
    private let firebaseUID: String
    
    /// The name that will be displayed on posts and to other user.
    var displayName: String
    
    /// The username (i.e. @HarryTDA) is for tagging this user in posts.
    var username: String
    
    /// The email address of this user.
    var emailAddress: String
    
    /// The URL string leading to the profile picture of the user.
    var pfpURL: String?
    
    /// The age of the user, used to restrict contents based on the age.
    var age: Int
    
    /// A boolean that identifies whether this is a protected account or not.
    var isProtectedAccount: Bool
    
    /// Create a generic Re:Connect user
    init() {
        self.uid = UUID().uuidString
        self.firebaseUID = ""
        self.displayName = "Generic User"
        self.username = "@generic_user"
        self.emailAddress = "no_email"
        self.pfpURL = ""
        self.age = -1
        self.isProtectedAccount = true
    }
    
    /// Create a Re:Connect user (for setting up basic information and other info filled out later)
    init(displayName: String, emailAddress: String, firebaseUID: String) {
        self.uid = UUID().uuidString
        self.firebaseUID = firebaseUID
        self.displayName = displayName
        self.username = ""
        self.emailAddress = emailAddress
        self.pfpURL = ""
        self.age = -1
        self.isProtectedAccount = true
    }
    
    /// Create a Re:Connect user (include all information beside the unique identifier)
    init(firebaseUID: String, displayName: String, username: String, emailAddress: String, pfpURL: String?, age: Int, isProtectedAccount: Bool) {
        self.uid = UUID().uuidString
        self.firebaseUID = firebaseUID
        self.displayName = displayName
        self.username = username
        self.emailAddress = emailAddress
        self.pfpURL = pfpURL
        self.age = age
        self.isProtectedAccount = isProtectedAccount
    }
    
    /// Create a Re:Connect user (only use this initializer for accounts that were created already)
    init(uid: String, firebaseUID: String, displayName: String, username: String, emailAddress: String, pfpURL: String?, age: Int, isProtectedAccount: Bool) {
        self.uid = uid
        self.firebaseUID = firebaseUID
        self.displayName = displayName
        self.username = username
        self.emailAddress = emailAddress
        self.pfpURL = pfpURL
        self.age = age
        self.isProtectedAccount = isProtectedAccount
    }
    
    /// Securely return the unique identifier of this user without having to call `user.uid` directly.
    /// - Returns: The unique identifier of this user.
    public func getUID() -> String {
        return self.uid
    }
    
    /// Securely return the Firebase UID of this user without having to call `user.firebaseUID` directly.
    /// - Returns: The Firebase UID of this user.
    public func getFirebaseUID() -> String {
        return self.firebaseUID
    }
    
    /// The generic placeholder user for displaying in previews when there are no data to work with.
    public static let placeholderUser = RECUser(firebaseUID: "00000000000000", displayName: "Generic User",
                                                username: "@GenericUser",
                                                emailAddress: "genericEmail@genericDomain.com",
                                                pfpURL: nil,
                                                age: 18,
                                                isProtectedAccount: true)
}
