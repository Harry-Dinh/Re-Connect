//
//  SidebarView.swift
//  Macintosh Info
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: ComputerView()) {
                Label("Computer", systemImage: "desktopcomputer")
            }
            
            NavigationLink(destination: HardwareSpecs()) {
                Label("Hardware Specs", systemImage: "cpu")
            }
            
            NavigationLink(destination: Text("Internal Drive")) {
                Label("Internal Drive", systemImage: "internaldrive")
            }
        }
        .listStyle(SidebarListStyle())
        .frame(maxWidth: 400)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
