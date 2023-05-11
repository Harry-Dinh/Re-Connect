//
//  RECSystemAlerts.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-11.
//

import SwiftUI

class RECSystemAlerts {
    // MARK: - Authentication Failures
    
    static let emailNotValid: [String: Any] = [
        "title": "Email Address Not Valid",
        "message": "The email address you entered might not have an \"@\" or it does not follow the standard format of an email address. Please retype and try again.",
    ]
    
    static let firebaseAccountCreationFailed: [String: Any] = [
        "title": "Failed to Create Account",
        "message": "There was a problem creating the account using Firebase Authentication API. Please check the database and auth page and try again."
    ]
    
    static let failedToUnwrapUserInfo: [String: Any] = [
        "title": "Failed to Unwrap User's Info",
        "message": "Cannot unwrap the user's email address and display name. Please check the database and try again."
    ]
}
