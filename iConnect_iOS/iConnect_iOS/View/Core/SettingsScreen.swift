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
                Section(header: Text("Developer")) {
                    Button("Sign Out") {
                        LoginVM.shared.signOutUser()
                        UserDefaults.standard.set("", forKey: "user_profile_email")
                        UserDefaults.standard.set("", forKey: "user_first_name")
                        UserDefaults.standard.set("", forKey: "user_last_name")
                        isSignedIn = false
                    }
                    
                    Button("Print the cached data") {
                        print("\(UserDefaults.standard.string(forKey: "user_first_name")!) \(UserDefaults.standard.string(forKey: "user_last_name")!)")
                    }
                    
                    Button("Print the UID") {
                        print("\(RegisterVM.shared.getUserUID())")
                    }
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
