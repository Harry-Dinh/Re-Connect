//
//  Login.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import SwiftUI

struct Login: View {
    
    @ObservedObject var viewModel = LoginVM.shared
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Re:Connect")
                .font(.title)
                .bold()
            
            VStack(spacing: 20) {
                CustomTextField(placeholder: "Email address", icon: "envelope", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                CustomSecureField(placeholder: "Password", icon: "lock", text: $viewModel.password)
                    .autocapitalization(.none)
                    .keyboardType(.default)
                
                Button(action: {
                    viewModel.signInCurrentUser(email: viewModel.email, password: viewModel.password)
                }, label: {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(
                            Rectangle()
                                .cornerRadius(15)
                                .frame(height: 45)
                        )
                })
            }
            .padding()
            
            Spacer()
            
            HStack(spacing: 3) {
                Text("Don't have an account yet? Sign up")
                Button(action: {
                    viewModel.showRegisterScreen.toggle()
                }, label: {
                    Text("here.")
                })
                .fullScreenCover(isPresented: $viewModel.showRegisterScreen, content: {
                    NavigationView {
                        Register()
                    }
                })
            }
            .font(.headline)
        }
        .padding(.vertical)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
