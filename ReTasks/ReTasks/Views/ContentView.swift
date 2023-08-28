//
//  ContentView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var authManager = AuthManager.shared
    
    var body: some View {
        if !authManager.isSignedIn {
            LoginView()
        } else {
            HomeView()
                .onAppear {
                    authManager.decodeUser()
                    print("Decode function called")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
