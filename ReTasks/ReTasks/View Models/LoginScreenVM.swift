//
//  LoginScreenVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

class LoginScreenVM: ObservableObject {
    static let viewModel = LoginScreenVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var presentRegisterScreen = false
    
    @Published var emailField = ""
    @Published var passwordField = ""
}
