//
//  SidebarView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct SidebarView: View {
    
    @ObservedObject var runtimeManager = RuntimeManager.shared
    
    var body: some View {
        List {
            NavigationLink(destination: ListDetailView(list: runtimeManager.inbox)) {
                SidebarRowView(list: runtimeManager.inbox, icon: "tray", isCoreList: true)
            }
            .onTapGesture {
                runtimeManager.setSelectedList(list: runtimeManager.inbox)
            }
            
            Section {
                NavigationLink(destination: ListDetailView(list: runtimeManager.todayList)) {
                    SidebarRowView(list: runtimeManager.todayList, icon: "star", isCoreList: true)
                }
                .onTapGesture {
                    runtimeManager.setSelectedList(list: runtimeManager.todayList)
                }
            } header: { Text("Smart Lists") }
            .collapsible(false)
            
            Section {
                ForEach(runtimeManager.todoLists) { list in
                    NavigationLink(destination: ListDetailView(list: list)) {
                        SidebarRowView(list: list, icon: "list.bullet", isCoreList: false)
                    }
                    .onTapGesture {
                        runtimeManager.setSelectedList(list: list)
                    }
                    .contextMenu {
                        Button("Rename...") {}
                        Button("Delete...") {}
                        Button("Show List Info") {}
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
