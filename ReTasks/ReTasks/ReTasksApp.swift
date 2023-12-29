//
//  ReTasksApp.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-17.
//

import SwiftUI
import FirebaseCore

@main
struct ReTasksApp: App {
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @AppStorage("deviceID") private var deviceID: String = ""
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    if isFirstLaunch {
                        print("First launch")
                        /*
                         - Assign device ID
                         - Create Inbox and Today lists (Future list coming later in the... future)
                         */
                        deviceID = UUID().uuidString
                        isFirstLaunch = false
                    }
                }
        }
    }
}
