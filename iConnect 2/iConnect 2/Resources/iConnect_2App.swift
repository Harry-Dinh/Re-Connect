//
//  iConnect_2App.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

@main
struct iConnect_2App: App {
    var body: some Scene {
        WindowGroup("") {
            ContentView()
        }
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
//        .windowStyle(HiddenTitleBarWindowStyle())
        
        Settings {
            SettingsWindow()
        }
    }
}
