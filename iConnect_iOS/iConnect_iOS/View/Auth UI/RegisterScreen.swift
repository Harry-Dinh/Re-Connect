//
//  RegisterScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var model = RegisterVM.shared
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.gray.opacity(0.2))
                    
                    TextField("First name", text: $model.firstName)
                        .padding()
                        .autocapitalization(.words)
                }
                .frame(width: 350, height: 52)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.gray.opacity(0.2))
                    
                    TextField("Last name", text: $model.lastName)
                        .padding()
                        .autocapitalization(.words)
                }
                .frame(width: 350, height: 52)
                
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
                
                Button(action: {
                    model.registerUser()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.blue)
                        
                        Text("Create Account")
                            .foregroundColor(.white)
                    }
                    .frame(width: 160, height: 50)
                })
            }
            .navigationBarItems(trailing: Button("Cancel") { presentationMode.wrappedValue.dismiss() })
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New iConnect Account")
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
