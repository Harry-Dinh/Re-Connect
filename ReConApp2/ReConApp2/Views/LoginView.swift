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
    @State private var showRegisterView = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
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
                    CustomTextField(text: .constant(""), placeholder: "Email address", isSecureTextEntry: false)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .focused($focusedField, equals: .email)
                        .onSubmit { focusedField = .password }
                        .submitLabel(.next)
                    
                    CustomTextField(text: .constant(""), placeholder: "Password", isSecureTextEntry: true)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        .focused($focusedField, equals: .password)
                        .onSubmit {
                            focusedField = nil
                            // Sign in actions
                        }
                        .submitLabel(.done)
                    
                    Button(action: {}) {
                        Text("Sign In")
                            .fontWeight(.semibold)
                            .frame(maxWidth: 300)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                    CustomEmptyView(width: 10, height: nil, color: .clear)
                    
                    HStack {
                        Text("Don't have an account? Create one")
                        Button("here") {
                            showRegisterView.toggle()
                        }
                        .fullScreenCover(isPresented: $showRegisterView, content: RegisterView.init)
                    }
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
