//
//  HelperMethods.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import Foundation

class HelperMethods {
    static let shared = HelperMethods()
    
    /// Locate a "." in the `email` and replace it with a dash "-".
    public func convertToSafeEmail(email: String) -> String {
        var safeEmail = ""
        
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
}
