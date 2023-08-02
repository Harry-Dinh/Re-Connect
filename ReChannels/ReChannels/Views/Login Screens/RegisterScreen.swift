//
//  RegisterScreen.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-08-02.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject private var viewModel = RegisterVM.viewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                VStack(spacing: 5) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 100))
                        .padding(.vertical)
                    Text("Create New Account")
                        .font(.title)
                        .bold()
                    
                    Text("Fill in a few basic information and we can get your new account up and running!")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                
                VStack(spacing: 20) {
                    TextField("Display name", text: $viewModel.displayNameField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    TextField("Email", text: $viewModel.emailField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $viewModel.passwordField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    Button(action: {}) {
                        Text("Create Account")
                            .fontWeight(.semibold)
                            .frame(width: 170)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                
                Spacer()
            }
            .background(
                LinearGradient(colors: [Color(.systemBackground), Color(.systemBackground), .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss.callAsFunction()
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
