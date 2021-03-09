//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

class LoginVM: ObservableObject {
    
    // MARK: - SwiftUI Properties
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @State var emailField = ""
    @State var passwordField = ""
    @State var showLoginErrorAlert = false
    
    // MARK: - Non SwiftUI Properties
    
    let alertTitle = "An Error Occurred"
    let alertMessage = "The email or password you entered is not correct. Please try again or create a new account."
}
