//
//  MenuView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("My Contents")) {
                    CustomListRow(title: "Saved Items", subtitle: nil, iconName: "bookmark.fill", tintColor: .orange)
                    CustomListRow(title: "Groups", subtitle: nil, iconName: "person.3.fill", tintColor: .blue)
                }
                .headerProminence(.increased)
                
                Section(header: Text("Application")) {
                    NavigationLink(destination: SettingsView()) {
                        CustomListRow(title: "Settings", subtitle: nil, iconName: "gearshape.fill", tintColor: .gray)
                    }
                    
                    CustomListRow(title: "About This App", subtitle: nil, iconName: "info.circle.fill", tintColor: .gray)
                }
                .headerProminence(.increased)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Menu")
                        .font(.title)
                        .bold()
                }
            }
            .searchable(text: .constant(""))
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
