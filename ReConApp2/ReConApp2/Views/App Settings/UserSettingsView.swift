//
//  UserSettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-17.
//

import SwiftUI

struct UserSettingsView: View {
    var body: some View {
        List {
            Button("Sign Out") {
                AuthVM.signOut()
            }
            
            Section(footer: Text("The current user's Firebase UID")) {
                Text(AuthVM.getUID() ?? "No UID")
                    .textSelection(.enabled)
            }
            
            Button("Delete Account", role: .destructive) {
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Account")
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
