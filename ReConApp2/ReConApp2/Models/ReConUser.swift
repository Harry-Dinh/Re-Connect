//
//  ReConUser.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-05.
//

import Foundation

struct ReConUser: Identifiable {
    var id: String
    
    
    init() {
        firstName = ""
        lastName = ""
        fullName = ""
        username = ""
        email = ""
        bio = ""
        age = 0
        gender = -1
        followerCount = 0
        followingCount = 0
        firebaseUID = ""
        profilePicURL = ""
        id = UUID().uuidString
        isPrivateAccount = false
        followers = []
        followings = []
        notifications = []
    }
    
    init(firstName: String, lastName: String, username: String, email: String, bio: String, age: Int, gender: Int, followerCount: Int, followingCount: Int, firebaseUID: String, profilePicURL: String?, isPrivateAccount: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        fullName = "\(firstName) \(lastName)"
        self.username = username
        self.email = email
        self.bio = bio
        self.age = age
        self.gender = gender
        self.followerCount = followerCount
        self.followingCount = followingCount
        self.firebaseUID = firebaseUID
        self.profilePicURL = profilePicURL
        self.id = UUID().uuidString
        self.isPrivateAccount = isPrivateAccount
        followers = []
        followings = []
        notifications = []
    }
    
    /// The user's first name
    var firstName: String
    
    /// The user's last name
    var lastName: String
    
    /// The user's full name consisting of `firstName` and `lastName`
    var fullName: String
    
    /// The user's username to display in the app (i.e: @JimKirk1701)
    var username: String
    
    /// The user's email address
    var email: String
    
    /// The short statement that tells other users about the current user and vice versa
    var bio: String
    
    /// The user's age, used to determine if they are under or over 18 to show/not show inappropriate contents
    var age: Int
    
    /// The user's gender
    var gender: Int
    
    /// The number of followers
    var followerCount: Int
    
    /// The number of people this user follows
    var followingCount: Int
    
    /// The user's Firebase Auth UID
    var firebaseUID: String
    
    /// The URL of the user's profile picture
    var profilePicURL: String?
    
    /// The user's account protection level
    var isPrivateAccount: Bool
    
    /// An array of `ReConUser` containing the users who followed the current user
    var followers: [ReConUser]
    
    /// An array of `ReConUser` containing the users that this user followed
    var followings: [ReConUser]
    
    /// An array of `ReConNotification` containing the notifications of this user
    var notifications: [ReConNotification]
}
