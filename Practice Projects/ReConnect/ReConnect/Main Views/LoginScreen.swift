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
            List {
                RECHeader(icon: "message.fill", label: "Welcome to Re:Connect", isListHeader: true)
                    .listRowBackground(Color.clear)
                
                Section {
                    RECAuthTextField(text: $viewModel.emailField,
                                     placeholderText: "Email address",
                                     iconStr: "envelope",
                                     isSecureTextEntry: false)
                    .keyboardType(.emailAddress)
                    
                    RECAuthTextField(text: $viewModel.passwordField,
                                     placeholderText: "Password",
                                     iconStr: "lock",
                                     isSecureTextEntry: true)
                }
                
                Section {
                    Button(action: {}) {
                        RECListButtonLabel(title: "Sign In", style: .backgroundProminant)
                    }
                    .listRowBackground(Color.accentColor)
                }
                
                Section {
                    Button(action: {
                        viewModel.presentRegisterScreen.toggle()
                    }) {
                        RECListButtonLabel(title: "Create Account", style: .labelProminant)
                    }
                    .listRowBackground(Color.accentColor.opacity(0.25))
                }
            }
            .fullScreenCover(isPresented: $viewModel.presentRegisterScreen, content: InitialRegisterView.init)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
