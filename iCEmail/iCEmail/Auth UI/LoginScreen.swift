//
//  LoginScreen.swift
//  iCEmail
//
//  Created by Harry Dinh on 2021-03-24.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var model = LoginVM.shared
    
    var body: some View {
        VStack {
            VStack {
                TextField("Email address", text: $model.emailField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $model.passwordField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            Button("Sign In") {
                model.signInWithCurrentUser()
            }
            
            Button("Create Account") {
                model.showRegisterScreen.toggle()
            }
            .sheet(isPresented: $model.showRegisterScreen, content: {
                RegisterScreen()
            })
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
