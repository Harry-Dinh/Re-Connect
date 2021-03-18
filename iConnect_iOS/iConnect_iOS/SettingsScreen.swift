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
        List {
            Button("Sign Out") {
                isSignedIn = false
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
