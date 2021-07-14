//
//  ProfileSetupView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-25.
//

import SwiftUI

struct AccountSetup: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView(imageName: "figure.wave.circle", imageSize: 100, displayColor: .accentColor)
                
                CustomEmptyView(width: nil, height: 5, foregroundColor: .clear)
                
                Text("Setting Up Your Profile")
                    .font(.title)
                    .bold()
                
                Text("Just a few more steps and you can start using iConnect and enjoy connecting with the ones you love without having to worry about your privacy!")
                    .lineLimit(10)
                    .padding(.horizontal)
                    .foregroundColor(.secondary)
                    .frame(height: 130)
                
                GroupBox(label: HStack {
                    Text("Let's start with your username!")
                    Spacer()
                    Button(action: {viewModel.learnMoreUsername.toggle()}, label: {
                        Image(systemName: "info.circle")
                    })
                }, content: {
                    TextField("@Username (e.g: @JimKirk1701)", text: $viewModel.username)
                        .font(.system(.body, design: .rounded))
                })
                .cornerRadius(25)
                .padding(.vertical, 7)
                .padding(.horizontal)
                
                GroupBox(label: HStack {
                    Text("Private Account")
                    Spacer()
                    Button(action: {viewModel.learnMorePrivateAccount.toggle()}, label: {
                        Image(systemName: "info.circle")
                    })
                }) {
                    Toggle(isOn: $viewModel.isPrivateAccount, label: {
                        Text("Use Private Account")
                    })
                }
                .cornerRadius(25)
                .padding(.vertical, 7)
                .padding(.horizontal)
                .alert(isPresented: $viewModel.learnMorePrivateAccount, content: {
                    Alert(title: Text("About Private Account"), message: Text(viewModel.privateAccountMessage), dismissButton: .cancel(Text("OK")))
                })
                .alert(isPresented: $viewModel.learnMoreUsername, content: {
                    Alert(title: Text("About Username"), message: Text(viewModel.usernameMessage), dismissButton: .cancel(Text("OK")))
                })
                
                NavigationLink(destination: DiagnosticPreferences()) {
                    Text("Continue")
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).frame(width: 200, height: 50))
                }
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.setupProfileDetails(username: viewModel.username, isPrivateAccount: viewModel.isPrivateAccount)
                })
            }
            .padding(.bottom)
        }
    }
}

struct ProfileSetupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountSetup()
        }
    }
}
