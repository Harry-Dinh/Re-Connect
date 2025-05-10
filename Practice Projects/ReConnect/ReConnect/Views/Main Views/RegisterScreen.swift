//
//  RegisterScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject private var viewModel = RegisterScreenVM.instance
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @Environment(\.dismiss) private var dismissView
    @FocusState private var focusedField: RegisterScreenVM.FocusFields?
    
    var body: some View {
        NavigationView {
            List {
                RECListHeader(icon: CUPSystemIcon.newProfile, label: "Create New Account", isListHeader: true)
                    .listRowBackground(Color.clear)
                
                Section {
                    RECAuthTextField(text: $viewModel.firstNameField,
                                     placeholderText: "First name",
                                     iconStr: CUPSystemIcon.person,
                                     isSecureTextEntry: false)
                    .textInputAutocapitalization(.words)
                    .focused($focusedField, equals: .firstName)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .lastName
                    }
                    
                    RECAuthTextField(text: $viewModel.lastNameField,
                                     placeholderText: "Last name",
                                     iconStr: CUPSystemIcon.person,
                                     isSecureTextEntry: false)
                    .textInputAutocapitalization(.words)
                    .focused($focusedField, equals: .lastName)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .email
                    }
                    
                    RECAuthTextField(text: $viewModel.emailField,
                                     placeholderText: "Email address",
                                     iconStr: CUPSystemIcon.emailEnvelope,
                                     isSecureTextEntry: false)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                    
                    RECAuthTextField(text: $viewModel.passwordField,
                                     placeholderText: "Password",
                                     iconStr: CUPSystemIcon.passwordLock,
                                     isSecureTextEntry: true)
                    .textInputAutocapitalization(.never)
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                        viewModel.createAccount(with: viewModel.emailField, and: viewModel.passwordField)
                        
                        withAnimation(.easeOut(duration: 0.3)) {
                            viewModel.pushToDetailedRegistration.toggle()
                        }
                    }
                }
                .autocorrectionDisabled()

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
                ToolbarItem(placement: .topBarLeading) {
                    RECSystemButton(.cancelButtonText) {
                        dismissView.callAsFunction()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    if focusedField != nil {
                        RECSystemButton(.dismissKeyboardIcon) {
                            focusedField = nil
                        }
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    if focusedField == nil {
                        Text("By creating this account, I agree to the Terms and Conditions.")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                            .multilineTextAlignment(.center)
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
