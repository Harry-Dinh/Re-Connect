//
//  ItemRowView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct ItemRowView: View {
    
    var toDoItem: ToDoItem
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "circle")
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            Text(toDoItem.name)
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(toDoItem: ToDoItem.example)
            .padding()
    }
}
