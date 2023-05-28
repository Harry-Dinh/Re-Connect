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
        NavigationView {
            List {
                TextField("Email address", text: $viewModel.emailField)
                SecureField("Password", text: $viewModel.passwordField)
                
                Section {
                    Button("Sign In") {
                        
                    }
                    
                    Button("Create Account") {
                        viewModel.presentRegisterScreen.toggle()
                    }
                }
            }
            .navigationTitle("Re:Tasks")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $viewModel.presentRegisterScreen, content: RegisterView.init)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
