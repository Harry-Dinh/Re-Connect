//
//  ContentView.swift
//  Shared
//
//  Created by Harry Dinh on 2021-04-25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    var body: some View {
        if !isSignedIn {
            Login()
        }
        else {
            CoreScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
