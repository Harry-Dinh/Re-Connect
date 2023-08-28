//
//  ReTasksApp.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI
import Firebase

@main
struct ReTasksApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
