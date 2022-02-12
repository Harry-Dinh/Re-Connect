//
//  ContentView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-04.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        if !isSignedIn {
            LoginView()
        }
        else {
            Text("Home!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
