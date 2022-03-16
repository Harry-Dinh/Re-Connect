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
    }
    
    init(firstName: String, lastName: String, username: String, email: String, bio: String, age: Int, gender: Int, followerCount: Int, followingCount: Int, firebaseUID: String, profilePicURL: String?) {
        self.firstName = firstName
        self.lastName = lastName
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
    }
    
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var bio: String
    var age: Int
    var gender: Int
    var followerCount: Int
    var followingCount: Int
    var firebaseUID: String
    var profilePicURL: String?
}
