//
//  LoginView.swift
//  Checked
//
//  Created by Harry Dinh on 2023-07-29.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "Checked", subtitle: "Get things done.", angle: 15, background: .pink)
                
                // Login form
                Form {
                    TextField("Email address", text: $email)
                        .textFieldStyle(.plain)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.plain)
                    
                    Button {
                        // Attempt login
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Login")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .padding()
                }
                .offset(y: -50)
                
                // Create account
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
