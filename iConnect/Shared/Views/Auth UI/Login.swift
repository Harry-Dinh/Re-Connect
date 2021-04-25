//
//  Login.swift
//  iConnect
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI

struct Login: View {
    @ObservedObject var viewModel = AuthVM.shared
    
    var body: some View {
        VStack {
            
            CustomEmptyView(width: nil, height: 20, foregroundColor: .clear)
            
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("iConnect")
                .font(.system(size: 30))
                .bold()
            
            VStack(spacing: 15) {
                Label {
                    TextField("Email address", text: $viewModel.loginEmailField)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } icon: {
                    Image(systemName: "envelope")
                        .frame(width: 30)
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(Color(.systemGray6))
                        .cornerRadius(15)
                )
                .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                
                Label {
                    SecureField("Password", text: $viewModel.loginPasswordField)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } icon: {
                    Image(systemName: "lock")
                        .frame(width: 30)
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundColor(Color(.systemGray6))
                        .cornerRadius(15)
                )
                .frame(width: UIScreen.main.bounds.width - 40, height: 50)
            }
            .padding(.horizontal)
            
            CustomEmptyView(width: nil, height: 1, foregroundColor: .clear)
            
            Button(action: {
                viewModel.signInCurrentUser(email: viewModel.loginEmailField, password: viewModel.loginPasswordField)
            }) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color("iconnectGreen"), Color("iconnectBlue")]), startPoint: .leading, endPoint: .trailing)
                        .cornerRadius(15.0)
                    
                    Text("Login")
                        .foregroundColor(.white)
                }
            }
            .frame(width: 150, height: 50)
            .padding(.horizontal)
            
            Spacer()
            
            HStack {
                Text("Don't have an account? Create one")
                    .bold()
                Button(action: {
                    viewModel.showRegister.toggle()
                }) {
                    Text("here")
                        .bold()
                }
                .sheet(isPresented: $viewModel.showRegister, content: {
                    Register()
                })
            }
        }
        .padding(.vertical)
    }
}

struct LoginPreview: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
