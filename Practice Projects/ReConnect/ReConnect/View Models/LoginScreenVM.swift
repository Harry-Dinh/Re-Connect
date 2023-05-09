//
//  LoginScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

class LoginScreenVM: ObservableObject {
    static let viewModel = LoginScreenVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var loggedInUser: RECUser = RECUser()
    
    @Published var emailField: String = ""
    @Published var passwordField: String = ""
    
    @Published var presentRegisterScreen = false
}
