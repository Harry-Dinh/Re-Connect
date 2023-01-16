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
        List(runtimeManager.todoLists) { list in
            Label(list.name, systemImage: "list.bullet")
        }
        .listStyle(.sidebar)
        .refreshable {
            runtimeManager.refreshListArray()
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
