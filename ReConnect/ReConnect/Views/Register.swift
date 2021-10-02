//
//  Register.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-10-02.
//

import SwiftUI

struct Register: View {
    
    @ObservedObject var viewModel = AuthVM.shared
    
    @State private var displayName = ""
    @State private var emailField = ""
    @State private var passwordField = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image(systemName: "lock.fill")
                    .font(.system(size: 110))
                    .foregroundColor(.teal)
                    .padding()
                
                VStack(spacing: 20) {
                    Label {
                        TextField("Name", text: $displayName)
                    } icon: {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.systemGray6)))
                    .padding(.horizontal)
                    
                    Label {
                        TextField("Email address", text: $emailField)
                    } icon: {
                        Image(systemName: "envelope")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.systemGray6)))
                    .padding(.horizontal)
                    
                    Label {
                        SecureField("Password", text: $passwordField)
                    } icon: {
                        Image(systemName: "key")
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(.systemGray6)))
                    .padding(.horizontal)
                }
                
                Button {
                    
                } label: {
                    Text("Continue")
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.teal))
                }
            }
        }
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Register()
        }
    }
}
