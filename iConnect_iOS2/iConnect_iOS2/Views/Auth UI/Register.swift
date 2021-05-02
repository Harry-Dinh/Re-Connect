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
            VStack {
                Image(systemName: "person.crop.square.fill.and.at.rectangle")
                    .font(.system(size: 170))
                    .foregroundColor(Color("iconnectBlue"))
                
                Text("New iConnect Account")
                    .font(Font.custom("Oxanium", size: 30))
                    .bold()
                
                CustomEmptyView(width: nil, height: 0.5, foregroundColor: .clear)
                
                VStack(spacing: 15) {
                    Label {
                        TextField("First name", text: $viewModel.firstNameField)
                    } icon: {
                        Image(systemName: "person")
                            .frame(width: 30)
                    }
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
                    .padding()
                    .padding(.horizontal)
                    .background(
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width - 40, height: 52)
                            .foregroundColor(Color(.systemGray6))
                            .cornerRadius(15)
                    )
                    
                    Button(action: {
                        viewModel.createUserAccount(firstName: viewModel.firstNameField, lastName: viewModel.lastNameField, email: viewModel.emailField, password: viewModel.passwordField)
                    }, label: {
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [Color("iconnectGreen"), Color("iconnectBlue")]), startPoint: .trailing, endPoint: .leading)
                            
                            Text("Create Account")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .foregroundColor(.white)
                        }
                        .frame(width: 200, height: 52)
                        .cornerRadius(15)
                    })
                }
                
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
            .preferredColorScheme(.dark)
    }
}
