//
//  ListDetailView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var runtimeManager = RuntimeManager.shared
    @ObservedObject var contentVM = ContentVM.shared
    @Environment(\.openWindow) var openWindow
    
    var list: ToDoList?
    
    var body: some View {
        if list != nil {
            List {
                ForEach(list!.todos) { item in
                    ItemRowView(toDoItem: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle(list!.name)
            .toolbar {
                
                ToolbarItemGroup(placement: .automatic) {
                    Button(action: {}) {
                        Image(systemName: "square.and.arrow.up")
                    }
                    
                    Group {
                        if runtimeManager.selectedSidebarRow != nil {
                            Menu {
                                Button("Edit List...") {}
                                    .disabled(runtimeManager.selectedSidebarRow!.isCoreList)
                                Button("Delete List...") {}
                                    .disabled(runtimeManager.selectedSidebarRow!.isCoreList)
                                Button("Duplicate List") {}
                                Button("Save as Template...") {}
                                Divider()
                                Button("Print...") {}
                            } label: {
                                Image(systemName: "ellipsis.circle")
                            }
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
        } else {
            Text("No List Selected")
                .font(.title)
                .foregroundColor(.secondary)
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(list: ToDoList.example)
    }
}
