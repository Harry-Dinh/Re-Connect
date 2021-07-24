//
//  HelperMethods.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import Foundation

class HelperMethods {
    static let shared = HelperMethods()
    
    // MARK: - PROPERTIES
    public let publicDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    // MARK: - METHODS
    /// Locate a "." in the `email` and replace it with a dash "-".
    public func convertToSafeEmail(email: String) -> String {
        var safeEmail = ""
        
        if email.contains(".") {
            safeEmail = email.replacingOccurrences(of: ".", with: "-")
        }
        
        return safeEmail
    }
}
