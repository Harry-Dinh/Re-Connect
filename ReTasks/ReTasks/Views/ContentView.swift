//
//  ContentView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                
            }
            .navigationTitle("Re:Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("New List") {}
                    Button("New Task") {}
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                        .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
