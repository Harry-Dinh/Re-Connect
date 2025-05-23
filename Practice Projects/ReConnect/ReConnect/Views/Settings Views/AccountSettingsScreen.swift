//
//  AccountSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct AccountSettingsScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    
    @State private var showOtherActionsActionSheet = false
    @State private var revealIdentifiers = false
    
    var body: some View {
        List {
            RECListHeader(
                icon: CUPSystemIcon.profile,
                renderingMode: .hierarchical,
                title: "Re:Connect Account",
                description: "Get an overview look of your account, disable or delete your account, or switch to a different Re:Connect Account.",
                isSuperHeader: false
            )

            Section("Account Info") {
                RECDisplayLabel(label: "Name",
                                value: loginVM.currentUser?.displayName ?? RECUser.placeholderUser.displayName)
                
                RECDisplayLabel(valueDisplayMode: .standard,
                                label: "Email",
                                value: loginVM.currentUser?.emailAddress ?? RECUser.placeholderUser.emailAddress)
                RECDisplayLabel(label: "Age", value: "\(loginVM.currentUser?.age ?? RECUser.placeholderUser.age)")
            }
            
            Section("Profile Info") {
                RECDisplayLabel(label: "Username", value: loginVM.currentUser?.username ?? RECUser.placeholderUser.username)
            }
            
            Section("Re:Connect Unique Indentifier") {
                Text(loginVM.currentUser?.getUID() ?? RECUser.placeholderUser.getUID())
                    .font(.system(.footnote, design: .monospaced, weight: .regular))
                    .foregroundColor(.secondary)
                    .redacted(reason: revealIdentifiers == true ? .privacy : .placeholder)
                    .onTapGesture {
                        revealIdentifiers.toggle()
                    }
            }
            
            Section("Firebase Unique Identifier") {
                Text(loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    .font(.system(.body, design: .monospaced, weight: .regular))
                    .foregroundColor(.secondary)
                    .redacted(reason: revealIdentifiers == true ? .privacy : .placeholder)
                    .onTapGesture {
                        revealIdentifiers.toggle()
                    }
            }
            
            Button(action: {
                loginVM.logOutUserAlert.toggle()
            }) {
                Label("Log Out", systemImage: CUPSystemIcon.exit)
                    .foregroundColor(.red)
            }
            
            Section {
                Button(action: {}) {
                    Label("Suspend Account", systemImage: CUPSystemIcon.suspendProfile)
                        .foregroundColor(.red)
                }
                
                Button(action: {}) {
                    Label("Delete Account", systemImage: CUPSystemIcon.deleteProfile)
                        .foregroundColor(.red)
                }
            } header: {
                Text("Other Account Actions")
            } footer: {
                Text("Suspend account stops your account from being active for a provided period of time. Delete account completely wipe all contents in your account immediately with no time given to recover your data.")
            }
        }
        .navigationTitle("Re:Connect Account")
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
