//
//  CoreScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-10.
//

import SwiftUI

struct CoreScreen: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home")
                .tabItem{ Label("Home", systemImage: "house") }
                .tag(0)
            Text("Search")
                .tabItem{ Label("Search", systemImage: "magnifyingglass") }
                .tag(1)
            MenuScreen()
                .tabItem{ Label("Menu", systemImage: "list.bullet") }
                .tag(2)
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
