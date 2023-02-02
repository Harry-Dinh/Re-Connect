//
//  ContentView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentVM.shared
    @Environment(\.openWindow) var openWindow
    
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
                        Button("New Task...") {
                            contentVM.newTaskAction.toggle()
                            
                            if (contentVM.newTaskAction || !contentVM.newTaskAction) {
                                openWindow.callAsFunction(id: "newTaskScreen")
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $contentVM.newListAction, content: CreateListView.init)
                }
                .menuIndicator(.hidden)
            }
        }
        .onAppear {
            print("on appear called")
            RuntimeManager.shared.inboxID = RuntimeManager.shared.inbox.id
            RuntimeManager.shared.todayID = RuntimeManager.shared.todayList.id
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
