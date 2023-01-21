//
//  ListDetailView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct ListDetailView: View {
    
    var list: ToDoList?
    
    var body: some View {
        if list != nil {
            List {
                ForEach(list!.todos) { item in
                    ItemRowView(toDoItem: item)
                }
            }
            .listStyle(.plain)
            .navigationTitle(list!.name)
        } else {
            Text("No List Selected")
                .font(.title)
                .foregroundColor(.secondary)
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(list: ToDoList.example)
    }
}
