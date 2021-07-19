//
//  Register.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                
                LogoView(icon: "plus.square", color: .accentColor)
                
                Text("Create New Account")
                    .font(.title)
                    .bold()
                
                VStack(spacing: 15) {
                    CustomTextField(placeholder: "First name", icon: "person", text: $viewModel.firstName)
                        .autocapitalization(.words)
                        .onTapGesture { viewModel.isTextFieldEditing = true }
                    
                    CustomTextField(placeholder: "Middle name (optional)", icon: "person", text: $viewModel.middleName)
                        .autocapitalization(.words)
                        .onTapGesture { viewModel.isTextFieldEditing = true }
                    
                    CustomTextField(placeholder: "Last name", icon: "person", text: $viewModel.lastName)
                        .autocapitalization(.words)
                        .onTapGesture { viewModel.isTextFieldEditing = true }
                    
                    CustomTextField(placeholder: "Email address", icon: "envelope", text: $viewModel.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .onTapGesture { viewModel.isTextFieldEditing = true }
                    
                    CustomSecureField(placeholder: "Password", icon: "lock", text: $viewModel.password)
                        .autocapitalization(.none)
                        .onTapGesture { viewModel.isTextFieldEditing = true }
                    
                    NavigationLink(destination: FurtherInfoScreen()) {
                        Text("Continue")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                Rectangle()
                                    .foregroundColor(.accentColor)
                                    .cornerRadius(20)
                                    .frame(height: 45)
                            )
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        viewModel.createUserAccount(firstName: viewModel.firstName, middleName: viewModel.middleName, lastName: viewModel.lastName, email: viewModel.email, password: viewModel.password)
                    })
                }
                .padding()
            }
            .padding(.top)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if viewModel.isTextFieldEditing {
                    Button(action: {
                        viewModel.isTextFieldEditing = false
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }, label: {
                        Text("Done")
                    })
                }
                else {
                    Button("Cancel") { self.presentationMode.wrappedValue.dismiss() }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Register()
        }
    }
}
