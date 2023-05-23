//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "Name",
                                    value: loginVM.loggedInUser?.displayName ?? RECUser.placeholderUser.displayName)
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "Username",
                                    value: loginVM.loggedInUser?.username ?? RECUser.placeholderUser.username)
                } header: {
                    Text("Display Profile Info")
                }
                
                Section {
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "REC UID",
                                    value: loginVM.loggedInUser?.getUID() ?? RECUser.placeholderUser.getUID())
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "Firebase UID",
                                    value: loginVM.loggedInUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "Email",
                                    value: loginVM.loggedInUser?.emailAddress ?? RECUser.placeholderUser.emailAddress)
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "Age",
                                    value: "\(loginVM.loggedInUser?.age ?? RECUser.placeholderUser.age)")
                    RECDisplayLabel(displayMode: .trailing,
                                    label: "PFP URL",
                                    value: loginVM.loggedInUser?.pfpURL ?? "pfpURL")
                } header: {
                    Text("Hidden User Info")
                }
            }
            .navigationTitle("My Profile")
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
