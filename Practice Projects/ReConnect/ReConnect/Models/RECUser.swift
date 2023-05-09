//
//  RECUser.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import Foundation

struct RECUser {
    /// The identifier that is unique to this user. This cannot be changed once initialized.
    private let uid: String
    
    /// The name that will be displayed on posts and to other user.
    var displayName: String
    
    /// The username (i.e. @HarryTDA) is for tagging this user in posts.
    var username: String
    
    /// The URL string leading to the profile picture of the user.
    var pfpURL: String?
    
    /// The age of the user, used to restrict contents based on the age.
    var age: Int
    
    /// A boolean that identifies whether this is a protected account or not.
    var isProtectedAccount: Bool
    
    /// Create a generic Re:Connect user
    init() {
        self.uid = UUID().uuidString
        self.displayName = "Generic User"
        self.username = "@generic_user"
        self.pfpURL = ""
        self.age = -1
        self.isProtectedAccount = true
    }
    
    /// Create a Re:Connect user (for setting up basic information and other info filled out later)
    init(displayName: String, age: Int) {
        self.uid = UUID().uuidString
        self.displayName = displayName
        self.username = ""
        self.pfpURL = ""
        self.age = age
        self.isProtectedAccount = true
    }
    
    /// Create a Re:Connect user (include all information beside the unique identifier)
    init(displayName: String, username: String, pfpURL: String?, age: Int, isProtectedAccount: Bool) {
        self.uid = UUID().uuidString
        self.displayName = displayName
        self.username = username
        self.pfpURL = pfpURL
        self.age = age
        self.isProtectedAccount = isProtectedAccount
    }
    
    /// The generic placeholder user for displaying in previews when there are no data to work with.
    public static let placeholderUser = RECUser(displayName: "Harry Dinh", username: "@HarryTDA", pfpURL: nil, age: 18, isProtectedAccount: true)
}
