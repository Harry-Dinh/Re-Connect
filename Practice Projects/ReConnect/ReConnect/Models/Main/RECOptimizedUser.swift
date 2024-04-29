//
//  RECOptimizedUser.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-04-29.
//

import Foundation

/// A "dummy" version of the `RECUser` object. This object is used for displaying other users in a list with the only a few minimum metadata.
struct RECOptimizedUser: Codable {
    var firebaseUID: String
    var displayName: String
    var isVerified: Bool
    var pfpURL: String
    var username: String
    
    init() {
        self.firebaseUID = "0000000000000"
        self.displayName = "Generic User"
        self.isVerified = false
        self.pfpURL = ""
        self.username = "@GenericUsername"
    }
    
    init(firebaseUID: String, displayName: String, isVerified: Bool, pfpURL: String, username: String) {
        self.firebaseUID = firebaseUID
        self.displayName = displayName
        self.isVerified = isVerified
        self.pfpURL = pfpURL
        self.username = username
    }
    
    public static let placeholder = RECOptimizedUser()
}
