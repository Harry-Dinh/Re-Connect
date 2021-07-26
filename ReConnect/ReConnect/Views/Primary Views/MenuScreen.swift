//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct MenuScreen: View {
    var body: some View {
        ScrollView {
            GroupBox {
                CustomListRow(hasIcon: true, showsChevron: false, icon: "lock.fill", title: "Re:Connect+", color: .accentColor)
            }
            .cornerRadius(15)
            .padding()
            
            GroupBox(label: Text("Others").foregroundColor(.secondary)) {
                NavigationLink(destination: SettingsScreen()) {
                    CustomListRow(hasIcon: true, showsChevron: true, icon: "gear", title: "Settings", color: .gray)
                }
                
                NavigationLink(destination: EmptyView()) {
                    CustomListRow(hasIcon: true, showsChevron: false, icon: "exclamationmark.bubble.fill", title: "Send Feedbacks", color: .gray)
                }
                
                NavigationLink(destination: EmptyView()) {
                    CustomListRow(hasIcon: true, showsChevron: false, icon: "questionmark", title: "Get Support", color: .gray)
                }
            }
            .cornerRadius(15)
            .padding()
        }
        .navigationTitle("Menu")
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MenuScreen()
        }
    }
}
