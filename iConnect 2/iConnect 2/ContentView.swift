//
//  ContentView.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var loginVM = LoginVM()
    
    var body: some View {
        if !loginVM.isSignIn {
            LoginScreen()
        }
        else if loginVM.isSignIn {
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
