//
//  File.swift
//  iConnect
//
//  Created by Harry Dinh on 2021-04-25.
//

import Firebase

class Methods {
    static let shared = Methods()
    
    public func convertToSafeEmail(email: String) -> String {
        var safeEmail: String = ""
        
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
}
