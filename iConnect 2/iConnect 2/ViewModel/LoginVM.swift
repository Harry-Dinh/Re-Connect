//
//  LoginVM.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI
import Cocoa

class LoginVM: ObservableObject {
    
    static let main = LoginVM()
    
    @Published var showRegisterScreen = false
    @State var isSignIn = false
    @Published var emailField = ""
    @Published var passwordField = ""
    @Published var showAlert = false
    
    let errorAlertMessage = "The email or password you've entered is either not correct or not found. Please try again or press 'Forgot Password'. If those methods won't work, you could try to verify email or create a new account."
}
