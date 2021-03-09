//
//  Settings.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct SettingsWindow: View {
    var body: some View {
        TabView {
            General()
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
            Accounts()
                .tabItem {
                    Label("Accounts", systemImage: "at")
                }
            
            Privacy()
                .tabItem { Label("Privacy", systemImage: "hand.raised") }
            
            Security()
                .tabItem { Label("Security", systemImage: "lock") }
            
            Advanced()
                .tabItem { Label("Advanced", systemImage: "gearshape.2") }
        }
        .tabViewStyle(DefaultTabViewStyle())
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsWindow()
    }
}
