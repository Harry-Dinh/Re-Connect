//
//  ContentView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-10-02.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        if isSignedIn {
            Home()
        }
        else {
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
