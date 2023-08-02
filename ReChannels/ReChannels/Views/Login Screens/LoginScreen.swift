//
//  LoginScreen.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject private var viewModel = LoginVM.viewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                VStack(spacing: 5) {
                    Image(systemName: "number.square.fill")
                        .foregroundColor(.accentColor)
                        .font(.system(size: 100))
                        .padding(.vertical)
                    Text("Welcome to Re:Channels")
                        .font(.title)
                        .bold()
                    
                    Text("Powerful channel-based messaging made easy.")
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal, 10)
                
                VStack(spacing: 20) {
                    TextField("Email", text: $viewModel.emailField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    SecureField("Password", text: $viewModel.passwordField)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                    
                    Button(action: {}) {
                        Text("Login")
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
        }
        .safeAreaInset(edge: .bottom) {
            Button("Create New Account") {
                viewModel.presentRegisterScreen.toggle()
            }
            .foregroundColor(.white)
        }
        .fullScreenCover(isPresented: $viewModel.presentRegisterScreen, content: RegisterScreen.init)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
