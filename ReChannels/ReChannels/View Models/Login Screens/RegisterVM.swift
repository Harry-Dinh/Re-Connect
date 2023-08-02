//
//  RegisterScreen.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-08-02.
//

import Foundation

class RegisterVM: ObservableObject {
    public static let viewModel = RegisterVM()
    
    @Published var displayNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
}
