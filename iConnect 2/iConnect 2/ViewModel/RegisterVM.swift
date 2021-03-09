//
//  RegisterVM.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import Cocoa
import SwiftUI

class RegisterVM: ObservableObject {
    
    static let main = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
}
