//
//  WelcomeScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        VStack {
            LogoView(icon: "checkmark.square", color: .green)
            Text("You're all set!")
                .font(.title)
                .bold()
                .padding()
            
            Text("Welcome to Re:Connect.\n\nWe hope you'll enjoy our next generation privacy-focused social media service. Don't worry about data collection, because we never collect them like the others!\n\nFrom Harry Dinh, developer of Re:Connect.")
                .padding(.horizontal)
                .foregroundColor(.secondary)
            
            Button(action: {
                viewModel.createUserAccount(firstName: viewModel.firstName, middleName: viewModel.middleName, lastName: viewModel.lastName, email: viewModel.email, password: viewModel.password)
                self.isSignedIn = true
            }, label: {
                Text("Get Started!")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Rectangle()
                            .frame(height: 45)
                            .cornerRadius(15)
                    )
            })
            .padding()
            .foregroundColor(.green)
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
