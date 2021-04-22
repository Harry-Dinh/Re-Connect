//
//  ExtensionMethods.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import Foundation

class ExtensionMethods {
    static let shared = ExtensionMethods()
    
    public func convertToSafeEmail(email: String) -> String {
        var safeEmail: String = ""
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
}
