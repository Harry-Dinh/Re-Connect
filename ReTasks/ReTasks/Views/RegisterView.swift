//
//  LoginView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI

struct RegisterView: View {
    
    // MARK: - OBSERVED INSTANCES
    
    @ObservedObject private var viewModel = RegisterVM.viewModel
    @ObservedObject private var authManager = AuthManager.shared
    
    // MARK: - SWIFTUI STATES
    
    @Environment(\.dismiss) var dismiss
    
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
                    Image(systemName: "person.crop.circle.badge.plus")
                        .font(.system(size: 80))
                        .foregroundColor(.accentColor)
                        .padding()
                    
                    Text(viewModel.HEADER_TITLE)
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                // Text Fields
                
                VStack(spacing: 10) {
                    TextField("Email address", text: $viewModel.emailField)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                    
                    SecureField("Password", text: $viewModel.passwordField)
                        .textFieldStyle(.roundedBorder)
                    
                    Text(viewModel.ACCOUNT_CREATION_DESCRIPTION)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                    
                    Button(action: {
                        authManager.createAccount(with: viewModel.emailField,
                                                  and: viewModel.passwordField)
                        viewModel.emailField = ""
                        viewModel.passwordField = ""
                    }) {
                        Text("Create Account")
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
            .safeAreaInset(edge: .top) {
                HStack {
                    Button("Cancel") {
                        dismiss.callAsFunction()
                    }
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
