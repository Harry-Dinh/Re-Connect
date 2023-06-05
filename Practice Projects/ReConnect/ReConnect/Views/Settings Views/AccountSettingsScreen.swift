//
//  AccountSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct AccountSettingsScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        List {
            Section {
                RECDisplayLabel(label: "Name",
                                value: loginVM.loggedInUser?.displayName ?? RECUser.placeholderUser.displayName)
                
                RECDisplayLabel(valueDisplayMode: .standard,
                                label: "Email",
                                value: loginVM.loggedInUser?.emailAddress ?? RECUser.placeholderUser.emailAddress)
            }
            
            Section {
                Text(loginVM.loggedInUser?.getUID() ?? RECUser.placeholderUser.getUID())
                    .font(.system(.footnote, design: .monospaced, weight: .regular))
                    .foregroundColor(.secondary)
            } header: {
                Text("Re:Connect Unique Indentifier")
            }
            
            Section {
                Text(loginVM.loggedInUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    .font(.system(.body, design: .monospaced, weight: .regular))
                    .foregroundColor(.secondary)
            } header: {
                Text("Firebase Unique Identifier")
            }
            
            Button(action: {
                loginVM.logOutUserAlert.toggle()
            }) {
                Label("Log Out", systemImage: CUPSystemIcon.exit)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Confirm Log Out?",
               isPresented: $loginVM.logOutUserAlert) {
            Button("Cancel", role: .cancel, action: {})
            Button("Log Out", role: .destructive) {
                loginVM.signOutUser()
            }
        } message: {
            Text("Are you sure you want to log out? You will have to enter your email and password to log in again.")
        }

    }
}

struct AccountSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountSettingsScreen()
        }
    }
}
