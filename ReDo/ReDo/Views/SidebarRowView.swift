//
//  SidebarRowView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct SidebarRowView: View {
    
    var listName: String
    
    var body: some View {
        HStack {
            Image(systemName: "list.bullet.circle")
                .font(.title)
            Text(listName)
        }
    }
}

struct SidebarRowView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarRowView(listName: "Groceries")
            .padding()
    }
}
