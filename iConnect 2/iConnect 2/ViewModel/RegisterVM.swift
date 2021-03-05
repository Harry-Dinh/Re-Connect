//
//  RegisterVM.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation

class RegisterVM: ObservableObject {
    
    static let main = RegisterVM()
    
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
}
