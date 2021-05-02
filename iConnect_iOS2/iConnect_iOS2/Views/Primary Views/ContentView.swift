//
//  ContentView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-01.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
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
