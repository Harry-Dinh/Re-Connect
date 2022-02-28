//
//  RegisterView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-15.
//

import SwiftUI

struct RegisterView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var vm = AuthVM.shared
    @FocusState var focusedField: AuthVM.AuthFields?
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section(header: Label("Basic Info", systemImage: "info.circle")) {
                        CustomTextField(text: $vm.firstName, placeholder: "First name", isSecureTextEntry: false)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.words)
                            .focused($focusedField, equals: .firstName)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .lastName }
                        CustomTextField(text: $vm.lastName, placeholder: "Last name", isSecureTextEntry: false)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.words)
                            .focused($focusedField, equals: .lastName)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .username }
                        
                        CustomTextField(text: $vm.username, placeholder: "Username (i.e. @JimKirk1701)", isSecureTextEntry: false)
                            .disableAutocorrection(true)
                            .textInputAutocapitalization(.none)
                            .keyboardType(.twitter)
                            .focused($focusedField, equals: .username)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .email }
                    }
                    .listRowSeparator(.hidden)
                    
                    Section(header: Label("Credentials", systemImage: "at")) {
                        CustomTextField(text: $vm.email, placeholder: "Email address", isSecureTextEntry: false)
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .focused($focusedField, equals: .email)
                            .submitLabel(.next)
                            .onSubmit { focusedField = .password }
                        CustomTextField(text: $vm.password, placeholder: "Password", isSecureTextEntry: true)
                            .textInputAutocapitalization(.none)
                            .disableAutocorrection(true)
                            .focused($focusedField, equals: .password)
                            .submitLabel(.done)
                            .onSubmit { focusedField = nil }
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .navigationTitle("Create New Account")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            
                            if focusedField == .username {
                                Button("Next") { focusedField = .email }
                            }
                            
                            Button("Done") { focusedField = nil }
                        }
                    }
                }
                
                if focusedField == nil {
                    VStack {
                        Spacer()
                        Button(action: {
                            AuthVM.createAccount(firstName: vm.firstName, lastName: vm.lastName, username: vm.username, email: vm.email, password: vm.password)
                        }) {
                            Text("Create Account")
                                .fontWeight(.semibold)
                                .frame(maxWidth: 300)
                        }
                        .ignoresSafeArea()
                        .buttonStyle(.borderedProminent)
                        .controlSize(.large)
                    }
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
