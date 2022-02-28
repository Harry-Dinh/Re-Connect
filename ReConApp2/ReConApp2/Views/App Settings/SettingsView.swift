//
//  SettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section(header: Text("User Account")) {
                Button("Sign Out") {
                    AuthVM.signOut()
                }
            }
            
            Section(header: Text("Developer")) {
                Button("Print current user UID") {
                    print(AuthVM.getUID() ?? "no UID")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
