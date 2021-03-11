//
//  LoginScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject var loginVM = LoginVM()
    @State var showRegisterScreen = false
    
    var body: some View {
        VStack {
            Text("Welcome to iConnect")
                .font(.system(size: 30))
            
            Text("The best and secured digital world")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
            
            ICCVEmptyView(width: nil, height: 20, color: .clear)
            
            TextField("Email address", text: $loginVM.emailField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $loginVM.passwordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ICCVEmptyView(width: nil, height: 15, color: .clear)
            
            Button(action: {
                withAnimation {
                    loginVM.signInWithCurrentUser {
                        loginVM.isSignedIn = true
                    }
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100, height: 40)
                    
                    Text("Sign In")
                        .foregroundColor(.white)
                }
            })
            .alert(isPresented: $loginVM.showLoginErrorAlert, content: {
                Alert(title: Text(loginVM.alertTitle), message: Text(loginVM.alertMessage), dismissButton: .cancel(Text("Dismiss")))
            })
            
            
            Button("Don't have an account? Create one here") {
                showRegisterScreen.toggle()
            }
            .sheet(isPresented: $showRegisterScreen, content: {
                RegisterScreen()
            })
        }
        .padding()
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
