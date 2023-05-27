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
                RECDisplayLabel(displayMode: .trailing,
                                label: "Name",
                                value: loginVM.loggedInUser?.displayName ?? RECUser.placeholderUser.displayName)
                
                RECDisplayLabel(displayMode: .trailing,
                                label: "Email",
                                value: loginVM.loggedInUser?.emailAddress ?? RECUser.placeholderUser.emailAddress)
            }
            
            Section {
                RECDisplayLabel(displayMode: .trailing,
                                label: "REC UID",
                                value: loginVM.loggedInUser?.getUID() ?? RECUser.placeholderUser.getUID())
                
                RECDisplayLabel(displayMode: .trailing,
                                label: "Firebase UID",
                                value: loginVM.loggedInUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
            }
            
            Button(action: {
                loginVM.signOutUser()
            }) {
                Label("Log Out", systemImage: CUPSystemIcon.exit)
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountSettingsScreen()
        }
    }
}
