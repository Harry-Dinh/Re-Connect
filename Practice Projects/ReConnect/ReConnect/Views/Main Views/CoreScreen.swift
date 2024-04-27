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
                .tabItem{ Label("Home", systemImage: CUPSystemIcon.home) }
                .tag(0)
            SearchScreen()
                .tabItem{ Label("Search", systemImage: CUPSystemIcon.magnifyingglass) }
                .tag(1)
            ProfileScreen()
                .tabItem { Label("Profile", systemImage: CUPSystemIcon.profile) }
                .tag(2)
            NotificationsScreen()
                .tabItem { Label("Notifications", systemImage: CUPSystemIcon.notification) }
                .tag(3)
            MenuScreen()
                .tabItem{ Label("Menu", systemImage: CUPSystemIcon.menuList) }
                .tag(4)
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
