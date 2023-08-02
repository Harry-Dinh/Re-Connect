//
//  ReChannelsApp.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import FirebaseCore
import SwiftUI

@main
struct ReChannelsApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
