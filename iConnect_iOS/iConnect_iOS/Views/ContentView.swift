//
//  ContentView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        if !isSignedIn {
            LoginScreen()
        }
        else {
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
