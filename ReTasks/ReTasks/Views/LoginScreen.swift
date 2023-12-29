//
//  LoginScreen.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-29.
//

import SwiftUI

struct LoginScreen: View {
    
    // Referencing the view model of the login screen
    @State private var viewModel = LoginScreenVM.viewModel
    
    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.email)
            SecureField("Password", text: $viewModel.password)
            
            Button("Sign In") {}
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            Button("Create Account") {
                viewModel.presentRegisterScreen.toggle()
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .sheet(isPresented: $viewModel.presentRegisterScreen, content: {
            RegisterScreen()
                .interactiveDismissDisabled()
        })
    }
}

#Preview {
    LoginScreen()
}
