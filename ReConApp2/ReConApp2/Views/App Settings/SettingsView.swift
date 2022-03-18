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
            Section {
                NavigationLink(destination: UserSettingsView()) {
                    CustomListRow(title: "User Account", iconName: "person.crop.circle.fill", tintColor: .primary)
                }
            }
            
            Section {
                NavigationLink(destination: EmptyView()) {
                    CustomListRow(title: "General", iconName: "gear", tintColor: .primary)
                }
                
                NavigationLink(destination: EmptyView()) {
                    CustomListRow(title: "Privacy & Security", iconName: "hand.raised.fill", tintColor: .primary)
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
