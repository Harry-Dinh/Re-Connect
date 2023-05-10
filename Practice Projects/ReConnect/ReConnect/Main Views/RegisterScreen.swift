//
//  RegisterScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var viewModel = RegisterScreenVM.viewModel
    @Environment(\.dismiss) var dismissView
    
    var body: some View {
        NavigationView {
            ScrollView {
                RECHeader(icon: "person.crop.circle.badge.plus", label: "Create New Account")
                
                VStack(spacing: 15) {
                    RECAuthTextField(text: $viewModel.firstNameField,
                                     placeholderText: "First name",
                                     iconStr: "person",
                                     isSecureTextEntry: false)
                    
                    RECAuthTextField(text: $viewModel.lastNameField,
                                     placeholderText: "Last name",
                                     iconStr: "person",
                                     isSecureTextEntry: false)
                    
                    RECAuthTextField(text: $viewModel.emailField,
                                     placeholderText: "Email address",
                                     iconStr: "envelope",
                                     isSecureTextEntry: false)
                    
                    RECAuthTextField(text: $viewModel.passwordField,
                                     placeholderText: "Password",
                                     iconStr: "lock",
                                     isSecureTextEntry: true)
                    
                    RECAuthButton(label: "Continue") {}
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismissView.callAsFunction()
                    }
                }
            }
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
