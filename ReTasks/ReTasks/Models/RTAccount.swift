//
//  RTAccount.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-03.
//

import Foundation

struct RTAccount: Codable {
    var firebaseUID: String
    var emailAddress: String
    
    init() {
        self.firebaseUID = "00000000000"
        self.emailAddress = "genericEmail@genericDomain.com"
    }
    
    init(firebaseUID: String, emailAddress: String) {
        self.firebaseUID = firebaseUID
        self.emailAddress = emailAddress
    }
    
    public static let placeholderAccount = RTAccount(firebaseUID: "00000000000",
                                                     emailAddress: "genericEmail@genericDomain.com")
}
