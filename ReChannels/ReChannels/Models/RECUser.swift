//
//  RECUser.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation

struct RECUser {
    var firebaseUID: String
    var displayName: String
    var pfpURL: String?
    var emailAddress: String
    
    init() {
        self.firebaseUID = UUID().uuidString
        self.displayName = "Generic Person"
        self.pfpURL = nil
        self.emailAddress = "genericEmail@genericDomain.com"
    }
    
    init(firebaseUID: String, displayName: String, pfpURL: String?, emailAddress: String) {
        self.firebaseUID = firebaseUID
        self.displayName = displayName
        self.pfpURL = pfpURL
        self.emailAddress = emailAddress
    }
    
    public static let placeholder = RECUser()
}
