//
//  Register.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        NavigationView {
            ScrollView {
                LogoView(imageName: "person.crop.circle.badge.plus", imageSize: 90, displayColor: Color("iconnectYellow"))
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("New iConnect Account")
                    .font(.title)
                    .bold()
                
                CustomEmptyView(width: nil, height: 0.5, foregroundColor: .clear)
                
                VStack(spacing: 10) {
                    Label {
                        TextField("First name", text: $viewModel.firstNameField)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 30)
                    }
                    .autocapitalization(.words)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(15)
                    )
                    
                    Label {
                        TextField("Last name", text: $viewModel.lastNameField)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 30)
                    }
                    .autocapitalization(.words)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(15)
                    )
                    
                    Label {
                        TextField("Email address", text: $viewModel.emailField)
                    } icon: {
                        Image(systemName: "envelope")
                            .frame(width: 30)
                    }
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(15)
                    )
                    
                    Label {
                        SecureField("Password", text: $viewModel.passwordField)
                    } icon: {
                        Image(systemName: "lock")
                            .frame(width: 30)
                    }
                    .autocapitalization(.none)
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(15)
                    )
                }
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                // Sign In Button
                NavigationLink(destination: DetailInfo()) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).frame(width: 150))
                }
                .disabled(viewModel.firstNameField.isEmpty && viewModel.lastNameField.isEmpty && viewModel.emailField.isEmpty && viewModel.passwordField.isEmpty)
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.createUserAccount(firstName: viewModel.firstNameField, lastName: viewModel.lastNameField, email: viewModel.emailField, password: viewModel.passwordField)
                })
                
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        LoginVM.shared.showRegister = false
                    }, label: {
                        Text("Cancel")
                    })
                }
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        Register()
    }
}
