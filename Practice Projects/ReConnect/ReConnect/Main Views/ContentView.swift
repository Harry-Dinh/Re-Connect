//
//  ContentView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = LoginScreenVM.viewModel
    
    var body: some View {
        if viewModel.isSignedIn {
            CoreScreen()
        } else {
            LoginScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
