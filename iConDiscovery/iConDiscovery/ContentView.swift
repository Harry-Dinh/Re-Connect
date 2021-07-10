//
//  ContentView.swift
//  iConDiscovery
//
//  Created by Harry Dinh on 2021-07-09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var urlBar = ""
    @State private var returnPressed = false
    
    var body: some View {
        VStack {
            if !returnPressed {
                Text("Nothing here...")
            }
            else {
                WebView(pageURL: urlBar)
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                TextField("", text: $urlBar, onCommit: {
                    returnPressed = true
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
