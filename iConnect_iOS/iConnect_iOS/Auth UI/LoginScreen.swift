//
//  LoginScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var authManager = AuthManager.shared
    
    var body: some View {
        VStack {
            TextField("Email address", text: $authManager.loginEmailField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $authManager.loginPasswordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Sign In") {
                authManager.signInWithCurrentUser()
            }
            
            Button("Create Account") {
                authManager.showRegisterScreen.toggle()
            }
            .sheet(isPresented: $authManager.showRegisterScreen, content: {
                RegisterScreen()
                    .padding()
            })
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
