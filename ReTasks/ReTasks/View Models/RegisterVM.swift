//
//  RegisterVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation

/// The view model for the register view.
class RegisterVM: ObservableObject {
    public static let viewModel = RegisterVM()
    
    // MARK: - FIELDS
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    // MARK: - ASSETS
    
    public let HEADER_TITLE = "Create New Account"
    public let ACCOUNT_CREATION_DESCRIPTION = "Your account will be used for our fast syncing service so all of your tasks will be updated almost instantly across all of your Apple devices."
}
