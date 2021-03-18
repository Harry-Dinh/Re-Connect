//
//  RegisterScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var model = RegisterVM.shared
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                TextField("First name", text: $model.firstName)
                    .padding()
            }
            .frame(width: 350, height: 52)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                TextField("Last name", text: $model.lastName)
                    .padding()
            }
            .frame(width: 350, height: 52)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                TextField("Email address", text: $model.emailField)
                    .padding()
            }
            .frame(width: 350, height: 52)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                SecureField("Password", text: $model.passwordField)
                    .padding()
            }
            .frame(width: 350, height: 52)
            
            Button(action: {
                model.registerUser()
            }, label: {
                Text("Create Account")
                    .foregroundColor(.white)
            })
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.blue)
            )
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
