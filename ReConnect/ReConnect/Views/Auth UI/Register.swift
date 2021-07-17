//
//  Register.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                CustomTextField(placeholder: "First name", icon: "person", text: $viewModel.firstName)
                    .autocapitalization(.words)
                
                CustomTextField(placeholder: "Last name", icon: "person", text: $viewModel.lastName)
                    .autocapitalization(.words)
                
                CustomTextField(placeholder: "Email address", icon: "envelope", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                CustomSecureField(placeholder: "Password", icon: "lock", text: $viewModel.password)
                    .autocapitalization(.none)
                
                NavigationLink(destination: EmptyView()) {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .cornerRadius(20)
                                .frame(height: 45)
                        )
                }
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.createUserAccount(firstName: viewModel.firstName, middleName: viewModel.middleName, lastName: viewModel.lastName, email: viewModel.email, password: viewModel.password)
                })
            }
            .padding()
        }
        .navigationTitle("Register Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Register()
        }
    }
}
