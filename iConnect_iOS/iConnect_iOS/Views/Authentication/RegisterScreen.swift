//
//  RegisterScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct RegisterScreen: View {
    
    @StateObject var registerVM = RegisterVM()
    @Environment(\.presentationMode) var dismissView
    
    var body: some View {
        VStack {
            Text("Create iConnect Account")
                .font(.system(size: 30))
            Text("One account. All services. All secured. All yours.")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
            
            ICCVEmptyView(width: nil, height: 20, color: .clear)
            
            HStack {
                Text("Let's start with the basic...")
                    .font(.subheadline)
                Spacer()
            }
            
            TextField("First name", text: $registerVM.firstNameField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .autocapitalization(.words)
                .disableAutocorrection(true)
            
            TextField("Last name", text: $registerVM.lastNameField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .autocapitalization(.words)
                .disableAutocorrection(true)
            
            TextField("Email address", text: $registerVM.emailField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            SecureField("Password", text: $registerVM.passwordField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Button("Continue") {}
                .padding()
                .foregroundColor(.white)
                .background(
                    Capsule()
                        .foregroundColor(.green)
                        .frame(height: 45)
                )
            
            Button("Cancel") {
                dismissView.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(.white)
            .background(
                Capsule()
                    .foregroundColor(Color.gray)
                    .frame(height: 40)
            )
        }
        .padding()
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
