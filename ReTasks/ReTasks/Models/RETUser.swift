//
//  RETUser.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation

struct RETUser: Codable {
    
    // MARK: - FIELDS
    
    var emailAddress: String
    var firebaseUID: String
    
    // MARK: - INITIALIZERS
    
    init() {
        self.emailAddress = "generic_name@generic_domain.com"
        self.firebaseUID = "0000 0000 0000 0000"
    }
    
    init(emailAddress: String, firebaseUID: String) {
        self.emailAddress = emailAddress
        self.firebaseUID = firebaseUID
    }
    
    // MARK: - PLACEHOLDER OBJECT
    
    public static let placeholder = RETUser()
}
