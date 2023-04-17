//
//  TaskRowView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-03-15.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: ToDoItem
    
    var body: some View {
        HStack {
            Button(action: {
                if !task.isCompleted {
                    task.setCompletion(isCompleted: true)
                } else {
                    task.setCompletion(isCompleted: false)
                }
            }) {
                Image(systemName: "app")
            }
            .buttonStyle(.plain)
            
            VStack(alignment: .leading) {
                Text(task.name)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: ToDoItem.example)
    }
}
