//
//  LoginVM.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation

class LoginVM: ObservableObject {
    public static let viewModel = LoginVM()
    
    @Published var emailField = ""
    @Published var passwordField = ""
    
    @Published var presentRegisterScreen = false
}
