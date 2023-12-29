//
//  HomeScreen.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-29.
//

import SwiftUI

struct HomeScreen: View {
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
    HomeScreen()
}
