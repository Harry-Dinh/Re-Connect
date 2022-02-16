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
                        CustomTextField(text: .constant(""), placeholder: "First name", isSecureTextEntry: false)
                            .focused($focusedField, equals: .firstName)
                        CustomTextField(text: .constant(""), placeholder: "Last name", isSecureTextEntry: false)
                            .focused($focusedField, equals: .lastName)
                    }
                    .listRowSeparator(.hidden)
                    
                    Section(header: Label("Credentials", systemImage: "at")) {
                        CustomTextField(text: .constant(""), placeholder: "Email address", isSecureTextEntry: false)
                            .focused($focusedField, equals: .email)
                        CustomTextField(text: .constant(""), placeholder: "Password", isSecureTextEntry: true)
                            .focused($focusedField, equals: .password)
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
                }
                
                VStack {
                    Spacer()
                    Button(action: {}) {
                        Text("Create Account")
                            .fontWeight(.semibold)
                            .frame(maxWidth: 300)
                    }
                    .ignoresSafeArea()
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .frame(width: UIScreen.main.bounds.width, height: 100)
                    .background(.ultraThinMaterial, in: Rectangle())
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
