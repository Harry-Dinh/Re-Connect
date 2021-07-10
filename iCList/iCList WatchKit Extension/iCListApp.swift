//
//  iCListApp.swift
//  iCList WatchKit Extension
//
//  Created by Harry Dinh on 2021-07-04.
//

import SwiftUI

@main
struct iCListApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
