//
//  iConnectApp.swift
//  Shared
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI

@main
struct iConnectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
