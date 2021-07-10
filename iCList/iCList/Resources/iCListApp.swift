//
//  iCListApp.swift
//  iCList
//
//  Created by Harry Dinh on 2021-07-04.
//

import SwiftUI
import Firebase

@main
struct iCListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
