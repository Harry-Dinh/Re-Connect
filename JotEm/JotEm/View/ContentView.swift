//
//  ContentView.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CoreView()
            EditorView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
