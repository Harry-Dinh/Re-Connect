//
//  LoginScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct LoginScreen: View {
    
    @State private var showRegisterScreen = false
    @ObservedObject var model = LoginVM.shared
    
    var body: some View {
        VStack {
            VStack {
                // Image("logo")
                
                Text("Welcome to iConnect")
                    .font(.title)
            }
            
            CustomEmptyView(width: nil, height: 5, color: .clear)
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.gray.opacity(0.2))
                    
                    TextField("Email address", text: $model.emailField)
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                .frame(width: 350, height: 52)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.gray.opacity(0.2))
                    
                    SecureField("Password", text: $model.passwordField)
                        .padding()
                        .autocapitalization(.none)
                }
                .frame(width: 350, height: 52)
            }
            
            Button(action: {
                model.signInWithCurrentUser()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.blue)
                    
                    Text("Sign In")
                        .foregroundColor(.white)
                }
                .frame(width: 150, height: 50)
            })
            
            CustomEmptyView(width: nil, height: 3, color: .clear)
            
            Button(action: {
                model.showRegisterScreen.toggle()
            }, label: {
                Text("Don't have an account yet? Tap here to register")
                    .font(.system(size: 15))
            })
            .sheet(isPresented: $model.showRegisterScreen, content: {
                RegisterScreen()
            })
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
