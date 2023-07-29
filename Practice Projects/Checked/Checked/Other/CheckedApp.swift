//
//  CheckedApp.swift
//  Checked
//
//  Created by Harry Dinh on 2023-07-29.
//

import FirebaseCore
import SwiftUI

@main
struct CheckedApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
