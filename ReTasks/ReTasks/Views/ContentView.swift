//
//  ContentView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        if !isSignedIn {
            LoginScreen()
        }
    }
}

#Preview {
    ContentView()
}
