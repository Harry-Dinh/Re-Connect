//
//  ReConnectApp.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-11-14.
//

import SwiftUI
import Firebase

@main
struct ReConnectApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
