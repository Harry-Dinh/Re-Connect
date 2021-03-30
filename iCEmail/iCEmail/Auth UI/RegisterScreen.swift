//
//  RegisterScreen.swift
//  iCEmail
//
//  Created by Harry Dinh on 2021-03-24.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var model = RegisterVM.shared
    
    var body: some View {
        VStack {
            VStack {
                TextField("First name", text: $model.firstNameField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Last name", text: $model.lastNameField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Email address", text: $model.emailField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $model.passwordField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button("Register Account") {
                model.registerUser(email: model.emailField, password: model.passwordField)
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
