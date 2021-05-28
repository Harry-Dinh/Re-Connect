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
                Image(systemName: "person.crop.square.fill.and.at.rectangle")
                    .font(.system(size: 150))
                    .foregroundColor(Color("iconnectBlue"))
                
                Text("New iConnect Account")
                    .font(Font.custom("Oxanium", size: 30))
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
                
                CustomEmptyView(width: nil, height: 10, foregroundColor: .clear)
                
                GroupBox(label: Text("Secondary Info"), content: {
                    VStack(alignment: .leading, spacing: 13) {
                        Label(
                            title: { DatePicker("Date of Birth", selection: $viewModel.dateOfBirth, displayedComponents: .date) },
                            icon: { Image(systemName: "calendar").foregroundColor(.red) })
                        
                        Label(
                            title: { TextField("Username (e.g: @YourName)", text: $viewModel.username) },
                            icon: { Image(systemName: "at").foregroundColor(.accentColor) })
                    }
                })
                .cornerRadius(15.0)
                .frame(width: UIScreen.main.bounds.width - 40)
                .padding(.horizontal)
                
                // Sign In Button
                Button(action: {
                    viewModel.createUserAccount(firstName: viewModel.firstNameField, lastName: viewModel.lastNameField, email: viewModel.emailField, password: viewModel.passwordField)
                }, label: {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [Color("iconnectYellow"), Color("iconnectBlue")]), startPoint: .trailing, endPoint: .leading)
                        
                        Text("Create Account")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                    }
                    .frame(width: 180, height: 50)
                    .cornerRadius(15)
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
