//
//  SettingsScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct SettingsScreen: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(
                        destination:
                            Button("Sign Out") {
                                LoginVM.shared.signOutUser()
                                DatabaseManager.shared.clearCachedDataFromUserDefaults()
                                isSignedIn = false
                            },
                        label: {
                            HStack {
                                CustomTableIcon(backgroundColor: .gray, icon: "person.crop.square.fill.and.at.rectangle")
                                Text("My Account")
                            }
                        })
                }
                
                Section(header: Text("Developer")) {
                    Button(action: {
                        // Test action here...
                    }, label: {
                        HStack {
                            CustomTableIcon(backgroundColor: .blue, icon: "hammer")
                            Text("Test Action")
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
