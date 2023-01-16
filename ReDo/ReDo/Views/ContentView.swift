//
//  ContentView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentVM.shared
    
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            EmptyView()
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Menu {
                    Button("New List...") {
                        contentVM.newListAction.toggle()
                    }
                    Button("New To Do...") {}
                } label: {
                    Image(systemName: "plus")
                }
                .menuIndicator(.hidden)
                .sheet(isPresented: $contentVM.newListAction, content: CreateListView.init)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
