//
//  ContentView.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        if !isSignedIn {
            LoginView()
        } else {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
