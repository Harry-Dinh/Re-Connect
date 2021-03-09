//
//  NavigationList.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct NavigationList: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        List {
            
            NavigationLink(destination: Home()) {
                Label("Home", systemImage: "house")
            }
            
            Label("Explore", systemImage: "safari")
            
            Section(header: Text("My Contents")) {
                Label("Account Name", systemImage: "person.crop.circle")
            }
            .collapsible(false)
        }
        .listStyle(SidebarListStyle())
        .toolbar(content: {
            ToolbarItem(placement: .navigation) {
                Button(action: {
                    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
                }, label: {
                    Image(systemName: "sidebar.left")
                        .imageScale(.large)
                })
            }
        })
    }
}

struct NavigationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationList()
    }
}
