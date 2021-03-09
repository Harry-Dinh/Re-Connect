//
//  RegisterScreen.swift
//  iConnect 2
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
                .font(.largeTitle)
            
            CustomEmptyView(width: nil, height: 5, color: .clear)
            
            Text("One account. All services. All secured. All yours")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
            
            CustomEmptyView(width: nil, height: 20, color: .clear)
            
            VStack {
                TextField("First name", text: $registerVM.firstNameField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350)
                
                TextField("Last name", text: $registerVM.lastNameField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350)
                
                TextField("Email address", text: $registerVM.emailField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350)
                
                SecureField("Password", text: $registerVM.passwordField)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 350)
            }
            
            CustomEmptyView(width: nil, height: 15, color: .clear)
            
            Button("Create Account") {}
                .buttonStyle(PlainButtonStyle())
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).frame(height: 30).foregroundColor(.blue))
                .foregroundColor(.white)
            
            CustomEmptyView(width: nil, height: 45, color: .clear)
            
            HStack {
                Spacer()
                Button("Cancel") {
                    withAnimation {
                        dismissView.wrappedValue.dismiss()
                    }
                }
            }
        }
        .padding()
        .frame(width: 450, height: 450)
    }
}

struct RegisterPreviews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
            .preferredColorScheme(.light)
    }
}
