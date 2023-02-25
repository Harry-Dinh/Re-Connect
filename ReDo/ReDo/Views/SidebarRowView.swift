//
//  SidebarRowView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct SidebarRowView: View {
    
    var list: ToDoList
    var icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(list.color)
            Text(list.name)
        }
    }
}

struct SidebarRowView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarRowView(list: ToDoList.example, icon: "list.bullet")
            .padding()
    }
}
