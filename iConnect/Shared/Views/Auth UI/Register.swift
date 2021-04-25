//
//  Register.swift
//  iConnect
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var viewModel = AuthVM.shared
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image(systemName: "person.crop.square.fill.and.at.rectangle")
                    .font(.system(size: 150))
                    .foregroundColor(Color("iconnectBlue"))
                
                // Text Fields
                VStack(spacing: 15) {
                    Label { TextField("First name", text: $viewModel.firstNameField)} icon: {Image(systemName: "person").frame(width: 30)}
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15.0)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    
                    Label { TextField("Last name", text: $viewModel.lastNameField)} icon: {Image(systemName: "person.fill").frame(width: 30)}
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15.0)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    
                    Label { TextField("Email address", text: $viewModel.registerEmailField)} icon: {Image(systemName: "envelope").frame(width: 30)}
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15.0)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    
                    Label { SecureField("Password", text: $viewModel.registerPasswordField)} icon: {Image(systemName: "lock").frame(width: 30)}
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(15.0)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                }
                
                Button(action: {
                    viewModel.registerUserAccount(firstName: viewModel.firstNameField, lastName: viewModel.lastNameField, email: viewModel.registerEmailField, password: viewModel.registerPasswordField)
                }, label: {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color("iconnectGreen"), Color("iconnectBlue")]), startPoint: .trailing, endPoint: .leading)
                            .cornerRadius(15.0)
                        
                        Text("Create Account")
                            .foregroundColor(.white)
                    }
                })
                .frame(width: 160, height: 50)
                
                Spacer()
            }
            .navigationTitle("Create New Account")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Cancel") {viewModel.showRegister = false})
            .textFieldStyle(PlainTextFieldStyle())
            .buttonStyle(PlainButtonStyle())
            .padding(.vertical)
        }
    }
}

struct RegisterPreview: PreviewProvider {
    static var previews: some View {
        Register()
            
    }
}
