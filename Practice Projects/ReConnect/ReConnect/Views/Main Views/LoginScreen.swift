//
//  LoginScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct LoginScreen: View {

    // MARK: - View Models

    @ObservedObject private var viewModel = LoginScreenVM.instance
    @FocusState private var focusedField: LoginScreenVM.FocusField?

    // MARK: - Local Constants

    private let welcomeLabel = "Welcome to Re:Connect"
    private let loginHeaderIcon = "\(CUPSystemIcon.message).fill"
    private let emailPlaceholder = "Email address"
    private let passwordPlaceholder = "Password"
    private let signInButtonLabel = "Sign In"

    // MARK: - View Components

    var body: some View {
        NavigationStack {
            List {
                welcomeHeader
                    .listRowBackground(Color.clear)
                userInfoFields
                loginButton
            }
            .fullScreenCover(
                isPresented: $viewModel.presentRegisterScreen,
                content: InitialRegisterView.init
            )
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    if focusedField != nil {
                        RECSystemButton(
                            .dismissKeyboardIcon,
                            action: { focusedField = nil }
                        )
                    }
                }

                ToolbarItemGroup(placement: .bottomBar) {
                    if focusedField == nil {
                        Button(action: {
                            viewModel.presentRegisterScreen.toggle()
                        }) {
                            Text("Create Account")
                                .fontWeight(.medium)
                        }
                    }
                }
            }
        }
    }

    var welcomeHeader: some View {
        RECListHeader(
            icon: loginHeaderIcon,
            label: welcomeLabel,
            isListHeader: true
        )
    }

    var userInfoFields: some View {
        Section {
            RECAuthTextField(
                text: $viewModel.emailField,
                placeholderText: emailPlaceholder,
                iconStr: CUPSystemIcon.emailEnvelope,
                isSecureTextEntry: false
            )
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .focused($focusedField, equals: .email)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .password
            }

            RECAuthTextField(
                text: $viewModel.passwordField,
                placeholderText: passwordPlaceholder,
                iconStr: CUPSystemIcon.passwordLock,
                isSecureTextEntry: true
            )
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .focused($focusedField, equals: .password)
            .submitLabel(.done)
            .onSubmit {
                focusedField = nil
                viewModel.login(with: viewModel.emailField, and: viewModel.passwordField)
            }
        }
    }

    var loginButton: some View {
        Section {
            Button(action: {
                viewModel.login(with: viewModel.emailField, and: viewModel.passwordField)
            }) {
                RECListButtonLabel(
                    title: signInButtonLabel,
                    style: .backgroundProminant
                )
            }
            .listRowBackground(Color.accentColor)
            .disabled(viewModel.emailField.isEmpty && viewModel.passwordField.isEmpty)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
