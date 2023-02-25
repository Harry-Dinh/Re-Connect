//
//  SidebarView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct SidebarView: View {
    
    @ObservedObject var runtimeManager = RuntimeManager.shared
    @ObservedObject var contentVM = ContentVM.shared
    
    var body: some View {
        List {
            NavigationLink(destination: ListDetailView(list: runtimeManager.inbox)) {
                SidebarRowView(list: runtimeManager.inbox, icon: "tray")
            }
            
            NavigationLink(destination: ListDetailView(list: runtimeManager.todayList)) {
                SidebarRowView(list: runtimeManager.todayList, icon: "star")
            }
            
            Section {
                ForEach(runtimeManager.userToDoLists) { list in
                    NavigationLink(destination: ListDetailView(list: list)) {
                        SidebarRowView(list: list, icon: "list.bullet")
                    }
                    .contextMenu {
                        Button("Rename...") {}
                        Button("Delete...") {
                            contentVM.listDeletionAlert.toggle()
                        }
                        
                        Button("Show List Info") {}
                    }
                    .alert("Delete \(list.name)?",
                           isPresented: $contentVM.listDeletionAlert) {
                        Button(role: .destructive) {
                            runtimeManager.removeList(list: list)
                        } label: {
                            Text("Delete")
                        }
                        
                    } message: {
                        Text("Are you sure you want to delete the list \"\(list.name)\"? This action cannot be undone.")
                    }
                }
            } header: {
                Text("My Lists")
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
