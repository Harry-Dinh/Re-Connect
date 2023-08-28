//
//  LoginVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation

/// The view model for the login view.
class LoginVM: ObservableObject {
    public static let viewModel = LoginVM()
    
    // MARK: - FIELDS
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    // MARK: - SWIFTUI STATES
    
    @Published var showRegisterScreen = false
    
    // MARK: - ASSETS
    
    public let HEADER_TITLE = "Welcome to Re:Tasks"
    public let HEADER_SUBTITLE = "Your powerful task manager."
    public let EMAIL_PLACEHOLDER = "Email address"
    public let PASS_PLACEHOLDER = "Password"
    public let SIGN_IN_BUTTON_LABEL = "Sign In"
    public let CREATE_ACCOUNT_INFO_LABEL = "Don't have a Re:Tasks account?"
    public let CREATE_ACCOUNT_BUTTON_LABEL = "Create one."
}
