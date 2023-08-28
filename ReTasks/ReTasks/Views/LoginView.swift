//
//  LoginView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject private var viewModel = LoginVM.viewModel
    @ObservedObject private var authManager = AuthManager.shared
    
    var body: some View {
        ZStack {
            // MARK: Background
            
            Rectangle()
                .foregroundColor(.accentColor)
                .blur(radius: 300)
                .ignoresSafeArea()
            
            
            // MARK: Main View
            VStack(spacing: 60) {
                // Header
                VStack(spacing: 5) {
                    Image(systemName: "list.triangle")
                        .font(.system(size: 80))
                        .foregroundColor(.accentColor)
                        .padding()
                    
                    Text(viewModel.HEADER_TITLE)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(viewModel.HEADER_SUBTITLE)
                        .foregroundColor(.secondary)
                }
                
                // Text Fields
                
                VStack(spacing: 10) {
                    TextField(viewModel.EMAIL_PLACEHOLDER, text: $viewModel.emailField)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                    
                    SecureField(viewModel.PASS_PLACEHOLDER, text: $viewModel.passwordField)
                        .textFieldStyle(.roundedBorder)
                    
                    Button(action: {
                        authManager.signIn(with: viewModel.emailField,
                                           and: viewModel.passwordField)
                        viewModel.emailField = ""
                        viewModel.passwordField = ""
                    }) {
                        Text(viewModel.SIGN_IN_BUTTON_LABEL)
                            .fontWeight(.semibold)
                            .frame(width: 250)
                    }
                    .padding(.top, 10)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                Spacer()
            }
            .padding()
            .safeAreaInset(edge: .bottom) {
                HStack {
                    Text(viewModel.CREATE_ACCOUNT_INFO_LABEL)
                    Button(viewModel.CREATE_ACCOUNT_BUTTON_LABEL) {
                        viewModel.showRegisterScreen.toggle()
                    }
                }
                .font(.subheadline)
            }
            .fullScreenCover(isPresented: $viewModel.showRegisterScreen, content: RegisterView.init)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
