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
            ListDetailView(list: nil)
        }
        .toolbar {
            
            ToolbarItemGroup(placement: .automatic) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                }
                
                Group {
                    Menu {
                        Button("Edit List...") {}
                        Button("Duplicate List") {}
                        Button("Delete List...") {}
                        Button("Save as Template...") {}
                        Divider()
                        Button("Print...") {}
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                    
                    Menu {
                        Button("New List...") {
                            contentVM.newListAction.toggle()
                        }
                        Button("New To Do...") {}
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $contentVM.newListAction, content: CreateListView.init)
                }
                .menuIndicator(.hidden)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
