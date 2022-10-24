//
//  ContentView.swift
//  CU Mobile
//
//  Created by Harry Dinh on 2022-10-20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            
            CampusView()
                .tabItem { Label("Campus", systemImage: "building.2") }
            
            AcademicsView()
                .tabItem { Label("Academics", systemImage: "graduationcap") }
            
            SafetyView()
                .tabItem { Label("Safety", systemImage: "exclamationmark.shield") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
