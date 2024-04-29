//
//  RECUser.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import Foundation

/// An object that represents a Re:Connect user
struct RECUser: Codable, Equatable {
    
    // MARK: - ENUMS
    
    public class Property {
        static let uid = "uid"
        static let displayName = "displayName"
        static let emailAddress = "emailAddress"
        static let pfpURL = "pfpURL"
        static let age = "age"
        static let isProtectedAccount = "isProtectedAccount"
        static let followerCount = "followerCount"
        static let followingCount = "followingCount"
        static let firebaseUID = "firebaseUID"
        static let username = "username"
        static let followings = "followings"
        static let followers = "followers"
        static let isVerified = "isVerified"
    }
    
    // MARK: - FIELDS
    
    /// The identifier that is unique to this user. This cannot be changed once initialized.
    let uid: String
    
    /// The Firebase Auth unique identifer, created when the user account is created using Firebase Auth API.
    let firebaseUID: String
    
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
    
    /// The people who followed this user.
    var followers: [RECUser]
    
    /// The people this user follow.
    var followings: [RECUser]
    
    /// The number of people who followed this user.
    var followerCount: Int
    
    /// The number of people this user is following.
    var followingCount: Int
    
    /// A boolean that tells the server that this user is verified. A user is verified when they have 1000 followers or more.
    var isVerifiedUser: Bool
    
    // MARK: - INITIALIZERS
    
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
        self.followers = []
        self.followings = []
        self.followerCount = 0
        self.followingCount = 0
        self.isVerifiedUser = false
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
        self.followers = []
        self.followings = []
        self.followerCount = 0
        self.followingCount = 0
        self.isVerifiedUser = false
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
        self.followers = []
        self.followings = []
        self.followerCount = 0
        self.followingCount = 0
        self.isVerifiedUser = false
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
        self.followers = []
        self.followings = []
        self.followerCount = 0
        self.followingCount = 0
        self.isVerifiedUser = false
    }
    
    init(_ dummyUser: RECOptimizedUser) {
        self.firebaseUID = dummyUser.firebaseUID
        self.displayName = dummyUser.displayName
        self.isVerifiedUser = dummyUser.isVerified
        self.username = dummyUser.username
        self.pfpURL = dummyUser.pfpURL
        
        self.uid = UUID().uuidString
        self.age = -1
        self.isProtectedAccount = false
        self.followers = []
        self.followings = []
        self.followerCount = -1
        self.followingCount = -1
        self.emailAddress = ""
    }
    
    // MARK: - FUNCTIONS
    
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
    
    public mutating func appendFollower(_ user: RECUser) {
        self.followers.append(user)
    }
    
    public mutating func appendFollowing(_ user: RECUser) {
        self.followings.append(user)
    }
    
    public mutating func setVerification(_ isVerified: Bool) {
        self.isVerifiedUser = isVerified
    }
    
    /// A required function to conform to the Equatable protocol. This allows RECUser objects to be compared to each other.
    static func ==(lhs: RECUser, rhs: RECUser) -> Bool {
        return lhs.firebaseUID == rhs.firebaseUID && lhs.uid == rhs.uid
    }
    
    // MARK: - OTHER OBJECT METHODS
    
    /// Convert the user's data to a dictionary (JSON) format to store the full user object in Firebase Database.
    public func toDictionary() -> [String: Any] {
        let dictionaryData: [String: Any] = [
            "\(self.firebaseUID)": [
                "\(RECUser.Property.uid)": self.uid,
                "\(RECUser.Property.displayName)": self.displayName,
                "\(RECUser.Property.username)": self.username,
                "\(RECUser.Property.pfpURL)": self.pfpURL ?? "",
                "\(RECUser.Property.age)": self.age,
                "\(RECUser.Property.isProtectedAccount)": self.isProtectedAccount,
                "\(RECUser.Property.firebaseUID)": self.firebaseUID,
                "\(RECUser.Property.isVerified)": self.isVerifiedUser,
                "\(RECUser.Property.followingCount)": self.followingCount,
                "\(RECUser.Property.followerCount)": self.followerCount,
                "\(RECUser.Property.followers)": self.followers,
                "\(RECUser.Property.followings)": self.followings
            ]
        ]
        return dictionaryData
    }
    
    /// Convert some of the user's data into a dictionary (JSON) format to store under the followings/followers node in Firebase Database.
    public func toOptimizedDict() -> [String: Any] {
        let dictionaryData: [String: Any] = [
            "\(self.firebaseUID)": [
                "\(RECUser.Property.firebaseUID)": self.firebaseUID,
                "\(RECUser.Property.displayName)": self.displayName,
                "\(RECUser.Property.username)": self.username,
                "\(RECUser.Property.isVerified)": self.isVerifiedUser,
                "\(RECUser.Property.pfpURL)": self.pfpURL ?? ""
            ]
        ]
        return dictionaryData
    }
    
    // MARK: - GENERIC OBJECT
    
    /// The generic placeholder user for displaying in previews when there are no data to work with.
    public static let placeholderUser = RECUser(firebaseUID: "00000000000000", displayName: "Generic User",
                                                username: "@GenericUser",
                                                emailAddress: "genericEmail@genericDomain.com",
                                                pfpURL: nil,
                                                age: 18,
                                                isProtectedAccount: true)
}
