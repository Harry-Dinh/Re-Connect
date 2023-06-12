//
//  LoginScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject private var viewModel = LoginScreenVM.viewModel
    @FocusState private var focusedField: LoginScreenVM.FocusField?
    
    var body: some View {
        NavigationView {
            List {
                RECListHeader(icon: "\(CUPSystemIcon.message).fill", label: "Welcome to Re:Connect", isListHeader: true)
                    .listRowBackground(Color.clear)
                
                Section {
                    RECAuthTextField(text: $viewModel.emailField,
                                     placeholderText: "Email address",
                                     iconStr: CUPSystemIcon.emailEnvelope,
                                     isSecureTextEntry: false)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
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
                    .autocorrectionDisabled()
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                        viewModel.login(with: viewModel.emailField, and: viewModel.passwordField)
                    }
                }
                
                Section {
                    Button(action: {
                        viewModel.login(with: viewModel.emailField, and: viewModel.passwordField)
                    }) {
                        RECListButtonLabel(title: "Sign In", style: .backgroundProminant)
                    }
                    .listRowBackground(Color.accentColor)
                    .disabled(viewModel.emailField.isEmpty && viewModel.passwordField.isEmpty)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") { focusedField = nil }
                    }
                }
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
