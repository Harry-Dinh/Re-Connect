//
//  RegisterVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

class RegisterVM: ObservableObject {
    
    static let shared = RegisterVM()
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @Published var firstNameField = ""
    @Published var lastNameField = ""
    @Published var emailField = ""
    @Published var passwordField = ""
}
