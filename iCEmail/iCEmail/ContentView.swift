//
//  ContentView.swift
//  iCEmail
//
//  Created by Harry Dinh on 2021-03-24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        if !isSignedIn {
            LoginScreen()
                .padding()
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
