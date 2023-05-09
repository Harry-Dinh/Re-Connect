//
//  LoginScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var viewModel = LoginScreenVM.viewModel
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Re:Connect")
                .font(.largeTitle)
                .bold()
            
            VStack(spacing: 10) {
                RECAuthTextField(text: $viewModel.emailField,
                                 placeholderText: "Email address",
                                 iconStr: "envelope",
                                 isSecureTextEntry: false)
                
                RECAuthTextField(text: $viewModel.passwordField,
                                 placeholderText: "Password",
                                 iconStr: "lock",
                                 isSecureTextEntry: true)
            }
            
            Button("Sign In") {}
                .buttonStyle(.borderedProminent)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
