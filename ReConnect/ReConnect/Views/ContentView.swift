//
//  ContentView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-11-14.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        if !AuthVM.shared.isSignedIn {
            AuthView()
        }
        else {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
