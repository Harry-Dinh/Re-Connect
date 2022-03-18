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
            
            Section(header: Text("Account Info")) {
                Text(AuthVM.getUID() ?? "No UID")
                    .font(.system(.body, design: .monospaced))
                    .textSelection(.enabled)
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
