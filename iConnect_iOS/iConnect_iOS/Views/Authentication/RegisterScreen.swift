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
            HStack {
                Spacer()
                Button(action: {
                    dismissView.wrappedValue.dismiss()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.gray)
                        
                        Text("Cancel")
                            .foregroundColor(.white)
                    }
                })
            }
            
            ICCVEmptyView(width: nil, height: 100, color: .clear)
            
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
            
            VStack {
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
            }
            
            Button(action: {
                registerVM.registerUserAccount {
                    print("Successfully created user")
                    // dismissing things here later...
                }
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 100,height: 40)
                    
                    Text("Continue")
                        .foregroundColor(.white)
                }
            })
            .disabled(registerVM.firstNameField == "" || registerVM.lastNameField == "" || registerVM.emailField == "" || registerVM.passwordField == "" ? true : false)
            
            Spacer()
        }
        .padding()
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
