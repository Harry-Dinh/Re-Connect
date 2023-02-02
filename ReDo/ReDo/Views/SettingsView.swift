//
//  SettingsView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            Text("General Tab")
                .tabItem {
                    Label("General", systemImage: "gearshape")
                }
            
            Text("Account Tab")
                .tabItem {
                    Label("Account", systemImage: "at")
                }
        }
        .frame(width: 300, height: 200)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
