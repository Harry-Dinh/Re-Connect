//
//  LoginScreenVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-29.
//

import Foundation
import SwiftUI

/// The view model for the login screen.
/// The view model is conformed to the new `@Observable` macro for iOS 17+, see the following link for detail: https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro
@Observable class LoginScreenVM {
    
    // A shared instance
    public static let viewModel = LoginScreenVM()
    
    // MARK: - SWIFTUI STATES
    
    var presentRegisterScreen: Bool = false
    
    // MARK: - BINDABLE VARIABLES
    
    /// A string that holds the user's email address when entering into a textfield
    var email: String = ""
    
    /// A string that holds the user's password when entering into a textfield (the textfield for this must be a `SecureField` so that the characters are hidden)
    var password: String = ""
}
