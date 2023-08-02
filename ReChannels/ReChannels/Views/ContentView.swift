//
//  ContentView.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var authManager = AuthenticationManager.shared
    
    var body: some View {
        if !authManager.isSignedIn {
            LoginScreen()
        } else {
            // Core screen
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
