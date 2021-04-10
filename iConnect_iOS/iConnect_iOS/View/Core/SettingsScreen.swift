//
//  SettingsScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct SettingsScreen: View {
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(
                        destination:
                            AccountView(),
                        label: {
                            HStack {
                                CustomTableIcon(backgroundColor: .gray, icon: "person.crop.square.fill.and.at.rectangle")
                                Text("My Account")
                            }
                        })
                }
                
                Section(header: Text("Developer")) {
                    Button(action: {
                        DatabaseManager.shared.numberOfPostOnFirestore()
                    }, label: {
                        HStack {
                            CustomTableIcon(backgroundColor: .blue, icon: "hammer")
                            Text("Print Number of Posts")
                        }
                    })
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
