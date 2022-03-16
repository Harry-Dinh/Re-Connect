//
//  CoreView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct CoreView: View {
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            TabView {
                HomeView()
                    .tabItem { Label("Home", systemImage: "house") }
                
                DiscoverView()
                    .tabItem { Label("Discover", systemImage: "safari") }
                
                ProfileView()
                    .tabItem { Label("Profile", systemImage: "person.crop.circle") }
                
                MenuView()
                    .tabItem { Label("Menu", systemImage: "list.bullet.rectangle.portrait")}
            }
        }
        else if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView {
                List {
                    NavigationLink(destination: ProfileView()) {
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                    
                    Section {
                        NavigationLink(destination: HomeView()) {
                            Label("Home", systemImage: "house")
                        }
                        
                        NavigationLink(destination: DiscoverView()) {
                            Label("Discover", systemImage: "safari")
                        }
                    }
                }
                .listStyle(.sidebar)
                .navigationTitle("Re:Connect")
            }
        }
    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
