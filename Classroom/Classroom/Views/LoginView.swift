//
//  LoginView.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-19.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var authVM = AuthVM.shared
    
    var body: some View {
        if !authVM.showRegisterView {
            VStack {
                VStack(spacing: 10) {
                    Image(systemName: "rectangle.inset.filled.and.person.filled")
                        .font(.system(size: 90))
                        .foregroundColor(.accentColor)
                    Text("Welcome to Classroom")
                        .font(.largeTitle)
                }
                
                VStack(alignment: .trailing) {
                    AuthViewTextField(text: .constant(""), placeholder: "Email address", isPrivateField: false)
                    AuthViewTextField(text: .constant(""), placeholder: "Password", isPrivateField: true)
                }
                .frame(width: 300)
                
                Button("Sign In") {}
                    .keyboardShortcut(.defaultAction)
                Button("Create New Account") {
                    authVM.showRegisterView = true
                }
            }
            .frame(width: 500, height: 500)
        } else {
            RegisterView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
