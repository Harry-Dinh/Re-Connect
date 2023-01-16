//
//  ReDoApp.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

@main
struct ReDoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(before: .systemServices) {
                Button("Refresh Sidebar") {
                    RuntimeManager.shared.refreshListArray()
                }
                .keyboardShortcut("r")
            }
            
            CommandGroup(replacing: .newItem) {
                Button("New To Do...") {}
                    .keyboardShortcut("n")
                Button("New List...") {}
                    .keyboardShortcut("n", modifiers: [.shift, .command])
            }
            
            CommandGroup(after: .newItem) {
                Divider()
                Button("Delete To Do") {}
                    .keyboardShortcut(.delete)
                Button("Delete List...") {}
                    .keyboardShortcut(.delete, modifiers: [.shift, .command])
            }
        }
        
        Settings {
            SettingsView()
        }
    }
}
