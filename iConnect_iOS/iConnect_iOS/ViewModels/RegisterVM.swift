//
//  RegisterVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

class RegisterVM: ObservableObject {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    @State var firstNameField = ""
    @State var lastNameField = ""
    @State var emailField = ""
    @State var passwordField = ""
}
