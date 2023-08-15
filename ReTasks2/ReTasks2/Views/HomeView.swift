//
//  HomeView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeVM()
    
    var body: some View {
        NavigationView {
            List {
                // MARK: SMART LISTS
                Section {
                    
                }
                
                // MARK: - USER'S LISTS
                Section("My Lists") {
                    ForEach(viewModel.myLists) { list in
                        RETListRowView(list: RETListWrapper(list))
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("New List") {
                        viewModel.showNewListView.toggle()
                    }
                    
                    Button("New Task") {}
                }
            }
            .sheet(isPresented: $viewModel.showNewListView, content: NewListView.init)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
