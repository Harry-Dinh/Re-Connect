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
            List {
                Text("Welcome to Re:Channels")
                
                Section {
                    TextField("Email address", text: $viewModel.emailField)
                    SecureField("Password", text: $viewModel.passwordField)
                }
                
                Section {
                    Button("Sign In") {}
                    Button("Create an Account") {}
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
