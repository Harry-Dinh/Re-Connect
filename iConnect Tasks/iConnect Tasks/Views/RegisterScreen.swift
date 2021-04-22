//
//  RegisterVM.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        VStack {
            Text("Register Account")
                .font(.title)
            
            ZStack {
                Color.black.opacity(0.1)
                
                TextField("First name", text: $viewModel.firstNameField)
                    .padding()
            }
            .frame(width: 300, height: 30)
            .cornerRadius(7)
            
            ZStack {
                Color.black.opacity(0.1)
                
                TextField("Last name", text: $viewModel.lastNameField)
                    .padding()
            }
            .frame(width: 300, height: 30)
            .cornerRadius(7)
            
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
                    Text("Register Account")
                        .foregroundColor(.white)
                }
            })
            .buttonStyle(PlainButtonStyle())
            .frame(width: 150, height: 30)
            .cornerRadius(7)
            
            CustomEmptyView(width: nil, height: 30, foregroundColor: .clear)
            
            HStack {
                Spacer()
                
                Button("Cancel") {
                    LoginVM.shared.showRegister = false
                }
            }
        }
        .textFieldStyle(PlainTextFieldStyle())
        .frame(width: 500, height: 300)
        .padding()
    }
}

struct RegisterVM_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
