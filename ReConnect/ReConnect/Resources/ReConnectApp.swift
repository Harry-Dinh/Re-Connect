//
//  ReConnectApp.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-17.
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
