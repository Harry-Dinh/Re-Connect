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
                SidebarRowView(list: runtimeManager.inbox, icon: "tray")
            }
            
            Section {
                ForEach(runtimeManager.todoLists) { list in
                    NavigationLink(destination: ListDetailView(list: list)) {
                        SidebarRowView(list: list, icon: "list.bullet")
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
