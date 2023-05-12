//
//  LoginScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

class LoginScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = LoginScreenVM()
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    /// A boolean that checks for if there is a user cached on the device and choose to present the login screen or core screen.
    @AppStorage("isSignedIn") var isSignedIn = false
    
    /// The current logged in user that is cached on this device.
    @Published var loggedInUser: RECUser = RECUser()
    
    /// The email field
    @Published var emailField: String = ""
    
    /// The password field
    @Published var passwordField: String = ""
    
    /// A binding boolean to present the registration screen.
    @Published var presentRegisterScreen = false
}
