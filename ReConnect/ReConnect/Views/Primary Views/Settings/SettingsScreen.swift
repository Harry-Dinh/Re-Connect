//
//  SettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                GroupBox {
                    NavigationLink(destination: AccountSettings()) {
                        CustomListRow(hasIcon: true, showsChevron: true, icon: "person.crop.circle.fill", title: "My Account", color: .accentColor)
                    }
                }
                .cornerRadius(15)
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Settings")
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsScreen()
        }
    }
}
