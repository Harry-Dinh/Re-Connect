//
//  HomeView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeVM()
    
    var body: some View {
        NavigationStack {
            List {
                Section("Actions") {
                    Button("Create Sample List") {}
                    Button("Create Sample Task") {}
                    Button("Add Sample Task to List") {}
                }
                
                Section("List JSON Preview") {
                    
                }
                
                Section("Task JSON Preview") {
                    
                }
                
                Section("List with Task JSON Preview") {
                    
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Re:Tasks UI Test")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
