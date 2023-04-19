//
//  ClassroomApp.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import SwiftUI

@main
struct ClassroomApp: App {
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some Scene {
        WindowGroup("Welcome to Classroom", id: "loginWindow") {
            LoginView()
        }
        .windowResizability(.contentSize)
        .windowToolbarStyle(.unified(showsTitle: false))
        
        WindowGroup(id: "mainWindow") {
            ContentView()
        }
    }
}
