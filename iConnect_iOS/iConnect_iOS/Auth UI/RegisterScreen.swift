//
//  RegisterScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI

struct RegisterScreen: View {
    
    @ObservedObject var authManager = AuthManager.shared
    
    var body: some View {
        VStack {
            TextField("First name", text: $authManager.firstNameField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Last name", text: $authManager.lastNameField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Email address", text: $authManager.registerEmailField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $authManager.registerPasswordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Create Account") {
                authManager.registerUser()
            }
            .alert(isPresented: $authManager.showRegisterAlertError, content: {
                Alert(title: Text("Failed to sign in"), dismissButton: .cancel(Text("OK")))
            })
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
