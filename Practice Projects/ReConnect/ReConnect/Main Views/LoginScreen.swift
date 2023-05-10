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
        NavigationView {
            VStack(spacing: 15) {
                RECHeader(icon: "message.fill", label: "Re:Connect")
                
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
                
                RECAuthButton(label: "Sign In") {}
                
                Spacer()
                
                HStack(spacing: 5) {
                    Text("Don't have an account? Create one")
                    Button("here.") {
                        viewModel.presentRegisterScreen.toggle()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $viewModel.presentRegisterScreen) {
                RegisterScreen()
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
