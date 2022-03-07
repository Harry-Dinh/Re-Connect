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
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
