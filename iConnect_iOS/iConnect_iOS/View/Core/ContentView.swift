//
//  ContentView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @AppStorage("write_to_database") var writeUserObjectToDatabase = false
    
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