//
//  ListView.swift
//  iCTasks
//
//  Created by Harry Dinh on 2021-04-17.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            // ListRow()
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button(action: {
                    NSApp.sendAction(#selector(NSSplitViewController.toggleSidebar(_:)), to: nil, from: nil)
                }, label: {
                    Image(systemName: "sidebar.left")
                })
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
