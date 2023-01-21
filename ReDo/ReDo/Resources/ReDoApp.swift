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
            CommandGroup(replacing: .newItem) {
                Button("New Task...") {
                    ContentVM.shared.newTaskAction.toggle()
                }
                    .keyboardShortcut("n")
                Button("New List...") {
                    ContentVM.shared.newListAction.toggle()
                }
                .keyboardShortcut("n", modifiers: [.shift, .command])
                
//                Divider()
//                
//                Button("Refresh Sidebar") {
//                    RuntimeManager.shared.refreshListArray()
//                }
//                .keyboardShortcut("r")
            }
            
            CommandGroup(after: .newItem) {
                Divider()
                Button("Delete To Do") {}
                    .keyboardShortcut(.delete, modifiers: [])
                Button("Delete List...") {}
                    .keyboardShortcut(.delete, modifiers: [.shift, .command])
            }
            
            CommandMenu("Debug") {
                Button("Print Lists in Array") {
                    RuntimeManager.shared.printlist()
                }
            }
        }
        
        Window("Create New Task", id: "newTaskScreen") {
            CreateTaskView()
        }
        .windowResizability(.contentSize)
        
        Settings {
            SettingsView()
        }
    }
}
