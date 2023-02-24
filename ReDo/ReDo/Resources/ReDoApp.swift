//
//  ReDoApp.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

@main
struct ReDoApp: App {
    
    @Environment(\.openWindow) var openWindow
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("New Task...") {
                    openWindow.callAsFunction(id: "newTaskScreen")
                }
                    .keyboardShortcut("n")
                Button("New List...") {
                    ContentVM.shared.newListAction.toggle()
                }
                .keyboardShortcut("n", modifiers: [.shift, .command])
            }
            
            CommandGroup(after: .newItem) {
                Divider()
                Button("Delete To Do") {}
                    .keyboardShortcut(.delete, modifiers: [])
                Button("Delete List...") {}
                    .keyboardShortcut(.delete, modifiers: [.shift, .command])
            }
        }
        
        Window("Create New Task", id: "newTaskScreen") {
            CreateTaskView()
        }
        .windowResizability(.contentSize)
        
        Settings {
            SettingsView()
        }
        .windowResizability(.contentSize)
    }
}
