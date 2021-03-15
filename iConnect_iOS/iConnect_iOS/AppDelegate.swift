//
//  AppDelegate.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import Firebase
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
