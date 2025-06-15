//
//  ReConnectApp.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ReConnectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject private var appSettingsManager = AppSettingsManager.instance
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.instance

    var body: some Scene {
        WindowGroup {
            ContentView()
                .tint(appearanceSettingsVM.accentColorOption == 0 ?
                      RECThemeColor.defaultAccentColor : appSettingsManager.appAccentColor
                )
                .preferredColorScheme(appearanceSettingsVM.setColorScheme())
        }
    }
}
