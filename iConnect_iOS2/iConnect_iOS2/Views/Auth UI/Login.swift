//
//  Login.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI

struct Login: View {
    
    @ObservedObject var viewModel = LoginVM.shared
    
    var body: some View {
        VStack {
            
            CustomEmptyView(width: nil, height: 45, foregroundColor: .clear)
            
            Image("logo")
                .resizable()
                .frame(width: 200, height: 200)
            
            Text("iConnect")
                .font(Font.custom("Oxanium", size: 40))
                .bold()
            
            CustomEmptyView(width: nil, height: 0.5, foregroundColor: .clear)
            
            VStack(spacing: 10) {
                Label {
                    TextField("Email address", text: $viewModel.emailField)
                } icon: {
                    Image(systemName: "envelope")
                        .frame(width: 30)
                }
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .padding()
                .padding(.horizontal)
                .background(
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                        .foregroundColor(Color(.systemGray6))
                        .cornerRadius(15)
                )
                
                Label {
                    SecureField("Password", text: $viewModel.passwordField)
                } icon: {
                    Image(systemName: "lock")
                        .frame(width: 30)
                }
                .autocapitalization(.none)
                .padding()
                .padding(.horizontal)
                .background(
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                        .foregroundColor(Color(.systemGray6))
                        .cornerRadius(15)
                )
                
                Button(action: {
                    viewModel.signInWithCurrentUser(email: viewModel.emailField, password: viewModel.passwordField)
                }, label: {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color("iconnectYellow"), Color("iconnectBlue")]), startPoint: .leading, endPoint: .trailing)
                        
                        Text("Login")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                    }
                    .frame(width: 150, height: 52)
                    .cornerRadius(15)
                })
            }
            
            Spacer()
            
            HStack(spacing: 5) {
                Text("Don't have an account? Create one")
                    .fontWeight(.semibold)
                Button(action: {
                    viewModel.showRegister.toggle()
                }, label: {
                    Text("here")
                        .fontWeight(.semibold)
                })
                .fullScreenCover(isPresented: $viewModel.showRegister, content: {
                    Register()
                })
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
            .preferredColorScheme(.dark)
    }
}
