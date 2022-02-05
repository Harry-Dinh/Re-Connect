//
//  ReConApp2.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-04.
//

import SwiftUI
import Firebase

@main
struct ReConApp2: App {
    
    init() {
        FirebaseApp.configure()
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont(name: "Rubik Light Bold", size: 34)!]
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Rubik Light Medium", size: 17)!]
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
