//
//  Dice_RollerApp.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-22.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        let _ = NSApplication.shared.windows.map { $0.tabbingMode = .disallowed }
    }
}

@main
struct Dice_RollerApp: App {
    
    @ObservedObject var viewModel = ContentVM.viewModel
    @Environment(\.openWindow) var openWindow
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup(id: "mainWindow") {
            ContentView()
        }
        .windowResizability(.contentSize)
        .commandsRemoved()
        .commands {
            CommandMenu("Actions") {
                Button("Roll") {
                    viewModel.dice1 = viewModel.rollDice()
                    viewModel.dice2 = viewModel.rollDice()
                }
                .keyboardShortcut("r")
                
                Button("Reset") {
                    viewModel.dice1 = 0
                    viewModel.dice2 = 0
                }
                .keyboardShortcut("r", modifiers: [.command, .shift])
            }
            
            CommandMenu("View") {
                Picker(selection: .constant(1)) {
                    Button("1 Dice") {}
                        .tag(0)
                    Button("2 Dices") {}
                        .tag(1)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.inline)
                
                Divider()
                
                Button("Close") {
                    NSApplication.shared.keyWindow?.close()
                }
                .keyboardShortcut("w")
                
                Button("New Window") {
                    openWindow.callAsFunction(id: "mainWindow")
                }
                .keyboardShortcut("n")
            }
        }
    }
}
