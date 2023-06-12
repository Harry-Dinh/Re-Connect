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
            FeedScreen()
                .tabItem{ Label("Feed", systemImage: CUPSystemIcon.newspaper) }
                .tag(0)
            ProfileScreen()
                .tabItem { Label("My Profile", systemImage: CUPSystemIcon.profile) }
                .tag(1)
            SearchScreen()
                .tabItem{ Label("Search", systemImage: CUPSystemIcon.magnifyingglass) }
                .tag(2)
            MenuScreen()
                .tabItem{ Label("Menu", systemImage: CUPSystemIcon.menuList) }
                .tag(3)
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
