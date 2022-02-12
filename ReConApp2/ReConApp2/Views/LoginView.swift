//
//  LoginView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-12.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var vm = AuthVM.shared
    @FocusState var focusedField: AuthVM.AuthFields?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 5) {
                    Image("logo")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text("Re:Connect")
                        .font(.custom("Rubik", size: 34, relativeTo: .largeTitle))
                        .fontWeight(.semibold)
                    Text("The world's most secure social media")
                        .font(.custom("Rubik", size: 17, relativeTo: .body))
                }
                
                CustomEmptyView(width: nil, height: 10, color: .clear)
                
                VStack(spacing: 10) {
                    TextField("Email Address", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .onSubmit { focusedField = .password }
                        .submitLabel(.next)
                    
                    SecureField("Password", text: .constant(""))
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .focused($focusedField, equals: .password)
                        .onSubmit {
                            focusedField = nil
                            // Sign in actions
                        }
                        .submitLabel(.done)
                    
                    Button(action: {}) {
                        Label("Sign In", systemImage: "checkmark.circle")
                            .font(.custom("Rubik Light Medium", size: 17, relativeTo: .body))
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    CustomEmptyView(width: nil, height: 5, color: .clear)
                    
                    Button(action: {}) {
                        Label("Create Account", systemImage: "person.crop.circle.badge.plus")
                            .font(.custom("Rubik Light Medium", size: 17, relativeTo: .body))
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.regular)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") { focusedField = nil }
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
