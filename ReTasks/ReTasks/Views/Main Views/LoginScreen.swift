//
//  LoginScreen.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject private var viewModel = LoginScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("An account is required to sync tasks on all your devices, or you can use Re:Tasks only on this device.")
                }
                .listRowBackground(Color.clear)
                
                TextField("Email address", text: $viewModel.emailField)
                SecureField("Password", text: $viewModel.passwordField)
                
                Button(action: {}) {
                    RTCustomButtonLabel(label: "Sign In")
                }
                
                Section {
                    Button(action: {
                        viewModel.presentActionSheet.toggle()
                    }) {
                        RTCustomButtonLabel(label: "Other Options", displayMode: .regularLabel)
                    }
                }
            }
            .navigationTitle("Welcome to Re:Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $viewModel.presentRegisterScreen, content: RegisterView.init)
            .confirmationDialog("_", isPresented: $viewModel.presentActionSheet, titleVisibility: .hidden) {
                Button("Create Account") {
                    viewModel.presentRegisterScreen.toggle()
                }
                
                Button("Use Re:Tasks Without Account") {
                    withAnimation(.default) {
                        viewModel.isSignedIn = true
                    }
                }
                
                Button("Cancel", role: .cancel, action: {})
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
