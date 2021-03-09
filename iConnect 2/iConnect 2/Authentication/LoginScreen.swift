//
//  LoginScreen.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI
import Cocoa

struct LoginScreen: View {
    
    @StateObject var loginVM = LoginVM()
    
    var body: some View {
        VStack(spacing: 5) {
            Text("Welcome to iConnect")
                .font(.largeTitle)
            Text("The best and secured digital world")
                .foregroundColor(.secondary)
                .font(.title2)
            
            CustomEmptyView(width: nil, height: 25, color: .clear)
            
            VStack(alignment: .center, spacing: 5) {
                
                TextField("Email address", text: $loginVM.emailField)
                    .frame(width: 250)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("Password", text: $loginVM.passwordField)
                    .frame(width: 250)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                CustomEmptyView(width: nil, height: 5, color: .clear)
                
                VStack {
                    Button("Sign In") {
                        loginVM.signInWithCurrentUser()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding()
                    .foregroundColor(.white)
                    .background(RoundedRectangle(cornerRadius: 15).frame(height: 30).foregroundColor(.blue))
                    .alert(isPresented: $loginVM.showAlert, content: {
                        Alert(title: Text("Oops!"), message: Text(loginVM.errorAlertMessage), dismissButton: .cancel(Text("Dismiss")))
                    })
                    
                    CustomEmptyView(width: nil, height: 5, color: .clear)
                    
                    Button(action: {self.loginVM.showRegisterScreen.toggle()}, label: {
                        Text("No account yet? Create one here")
                            .font(.body)
                    })
                    .buttonStyle(LinkButtonStyle())
                    .sheet(isPresented: $loginVM.showRegisterScreen, content: {
                        RegisterScreen()
                    })
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoginPreview: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
