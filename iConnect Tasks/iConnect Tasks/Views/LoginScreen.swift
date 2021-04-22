//
//  LoginVM.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var viewModel = LoginVM.shared
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome to iCTasks")
                    .font(.title)
                
                ZStack {
                    Color.black.opacity(0.1)
                    
                    TextField("Email address", text: $viewModel.emailField)
                        .padding()
                }
                .frame(width: 300, height: 30)
                .cornerRadius(7)
                
                ZStack {
                    Color.black.opacity(0.1)
                    
                    SecureField("Password", text: $viewModel.passwordField)
                        .padding()
                }
                .frame(width: 300, height: 30)
                .cornerRadius(7)
                
                Button(action: {}, label: {
                    ZStack {
                        Color(.systemBlue)
                        Text("Sign In")
                            .foregroundColor(.white)
                    }
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 150, height: 30)
                .cornerRadius(7)
                
                Button(action: {
                    viewModel.showRegister.toggle()
                }, label: {
                    Text("No Account? Click here to create one")
                        .foregroundColor(Color(.systemBlue))
                })
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $viewModel.showRegister, content: {
                    RegisterScreen()
                })
            }
            .textFieldStyle(PlainTextFieldStyle())
            .padding()
        }
        .frame(width: 400, height: 300)
    }
}

struct LoginVM_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
