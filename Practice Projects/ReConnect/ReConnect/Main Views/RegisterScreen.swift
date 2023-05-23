//
//  RegisterScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var viewModel = RegisterScreenVM.viewModel
    @ObservedObject var loginVM = LoginScreenVM.viewModel
    @Environment(\.dismiss) var dismissView
    
    var body: some View {
        NavigationView {
            List {
                RECHeader(icon: "person.crop.circle.badge.plus", label: "Create New Account", isListHeader: true)
                    .listRowBackground(Color.clear)
                
                Section {
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
                }
                
                Button(action: {
                    viewModel.createAccount(with: viewModel.emailField, and: viewModel.passwordField)
                    
                    withAnimation(.easeOut(duration: 0.3)) {
                        viewModel.pushToDetailedRegistration.toggle()
                    }
                }) {
                    RECListButtonLabel(title: "Continue", style: .backgroundProminant)
                }
                .listRowBackground(Color.accentColor)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        dismissView.callAsFunction()
                    }
                }
            }
            .alert("Email Not Valid", isPresented: $viewModel.showEmailNotValidAlert) {
                Button(role: .cancel, action: {}) {
                    Text("Dismiss")
                }
            }
            .alert("Account Creation Failed", isPresented: $viewModel.firebaseAccountCreationFailed) {
                Button(role: .cancel, action: {}) {
                    Text("Dismiss")
                }
            }
            .alert("Unwrap Failed", isPresented: $viewModel.failedToUnwrapUserInfo) {
                Button(role: .cancel, action: {}) {
                    Text("Dismiss")
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
