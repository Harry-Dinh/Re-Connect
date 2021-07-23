//
//  ProfileSetup.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct ProfileSetup: View {
    
    @ObservedObject var viewModel = RegisterVM.shared
    
    var body: some View {
        ScrollView {
            VStack {
                LogoView(icon: "person.crop.circle", color: .accentColor)
                    .padding(.vertical)
                
                Text("Setup Your Profile")
                    .font(.title)
                    .bold()
                
                Text("Just a few more steps to set up your profile before you can start using Re:Connect.")
                    .foregroundColor(.secondary)
                    .frame(height: 50)
                    .padding()
                
                Section {
                    GroupBox(label: Text("Profile Information & Settings"), content: {
                        TextField("Username (e.g: @JimKirk1701)", text: $viewModel.username)
                        
                        Toggle(isOn: $viewModel.isPrivateAccount, label: {
                            Text("Use Private Account")
                        })
                    })
                    .cornerRadius(17)
                    .padding(.horizontal)
                    
                    GroupBox {
                        Toggle(isOn: $viewModel.allowDiagnosticCollection, label: {
                            Text("Allow Diagnostic Info Collections")
                        })
                    }
                    .cornerRadius(17)
                    .padding([.top, .horizontal])
                }
                
                NavigationLink(destination: WelcomeScreen()) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .background(
                            Rectangle()
                                .foregroundColor(.accentColor)
                                .cornerRadius(15)
                                .frame(height: 45)
                        )
                }
                .padding()
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.updateUserProfileInfo(username: viewModel.username, isPrivateAccount: viewModel.isPrivateAccount, allowDiagnosticCollection: viewModel.allowDiagnosticCollection)
                })
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ProfileSetup_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileSetup()
        }
    }
}
