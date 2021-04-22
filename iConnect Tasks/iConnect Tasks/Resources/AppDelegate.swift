//
//  AppDelegate.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import AppKit
import Firebase

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
    }
}
