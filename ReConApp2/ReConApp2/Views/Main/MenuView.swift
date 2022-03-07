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
                Section(header: Text("Application")) {
                    NavigationLink(destination: SettingsView()) {
                        CustomListRow(title: "Settings", subtitle: nil, iconName: "gearshape.fill", tintColor: .gray)
                    }
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
