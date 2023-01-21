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
            ForEach(runtimeManager.todoLists) { list in
                NavigationLink(destination: ListDetailView(list: list)) {
                    SidebarRowView(listName: list.name)
                }
            }
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
