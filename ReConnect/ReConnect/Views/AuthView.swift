//
//  AuthView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-11-14.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var viewModel = AuthVM.shared
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                TextField("Email address", text: $viewModel.loginEmail)
                    .padding()
                    .background(Rectangle().cornerRadius(13).foregroundColor(Color(.systemGray6)))
                
                SecureField("Password", text: $viewModel.loginEmail)
                    .padding()
                    .background(Rectangle().cornerRadius(13).foregroundColor(Color(.systemGray6)))
                
                Button("Sign In") {
                    
                }
            }
            .padding()
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
