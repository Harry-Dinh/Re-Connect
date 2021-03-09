//
//  LoginScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI
import AuthenticationServices

struct LoginScreen: View {
    
    @StateObject var loginVM = LoginVM()
    @State var showLoginScreen = false
    
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
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $loginVM.passwordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            ICCVEmptyView(width: nil, height: 15, color: .clear)
            
            Button("Sign In") {
                if !loginVM.emailField.isEmpty,
                   !loginVM.passwordField.isEmpty,
                   loginVM.passwordField.count >= 6,
                   loginVM.emailField.contains("@") {
                    loginVM.isSignedIn = true
                    print("Verified and logged in")
                }
                else {
                    print("error occurred")
                    loginVM.showLoginErrorAlert = true
                }
            }
            .alert(isPresented: $loginVM.showLoginErrorAlert, content: {
                Alert(title: Text(loginVM.alertTitle), message: Text(loginVM.alertMessage), dismissButton: .cancel(Text("Dismiss")))
            })
            .padding()
            .foregroundColor(.white)
            .background(
                Capsule()
                    .foregroundColor(.blue)
                    .frame(height: 45)
            )
            .disabled(loginVM.emailField == "" || loginVM.passwordField == "" ? true : false)
            
            
            Button("Don't have an account? Create one here") {
                showLoginScreen.toggle()
            }
            .sheet(isPresented: $showLoginScreen, content: {
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
