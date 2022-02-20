//
//  CoreView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct CoreView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
            
            MenuView()
                .tabItem { Label("Menu", systemImage: "list.bullet.rectangle.portrait")}
        }
    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
