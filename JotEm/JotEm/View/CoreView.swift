//
//  CoreView.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import SwiftUI

struct CoreView: View {
    var body: some View {
        List {
            
        }
        .navigationTitle("My Notes")
        .listStyle(SidebarListStyle())
    }
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
