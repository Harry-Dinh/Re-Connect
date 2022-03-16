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
            CoreView()
                .onAppear {
                    ProfileVM.getUserInfo()
                    DiscoverVM.shared.getAllUsers()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
