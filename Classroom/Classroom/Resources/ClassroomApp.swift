//
//  ClassroomApp.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
    }
}

@main
struct ClassroomApp: App {
    
    @Environment(\.openWindow) var openWindow
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup("Welcome to Classroom", id: "loginWindow") {
            LoginView()
                .onAppear {
                    if Auth.auth().currentUser != nil {
                        let hostingVC = NSHostingController(rootView: LoginView())
                        let window = NSWindow(contentViewController: hostingVC)
                        let windowController = NSWindowController()
                        windowController.window = window
                        windowController.window?.close()
                        openWindow.callAsFunction(id: "mainWindow")
                    }
                }
        }
        .windowResizability(.contentSize)
        .windowToolbarStyle(.unified(showsTitle: false))
        
        WindowGroup(id: "mainWindow") {
            ContentView()
        }
    }
}
