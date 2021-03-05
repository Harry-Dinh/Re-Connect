//
//  LoginVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

class LoginVM: ObservableObject {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @State var emailField = ""
    @State var passwordField = ""
}
