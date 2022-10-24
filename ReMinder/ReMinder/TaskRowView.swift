//
//  TaskRowView.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: TaskItem
    
    @State private var completed = false
    
    var body: some View {
        HStack(alignment: .center) {
            Label {
                Text(task.title)
            } icon: {
                Button(action: {
                    completed.toggle()
                }) {
                    if !completed {
                        Image(systemName: "square")
                    }
                    else {
                        Image(systemName: "checkmark.square.fill")
                    }
                }
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing: 10) {
                if task.isFlagged {
                    Image(systemName: "exclamationmark.2")
                        .foregroundColor(.orange)
                        .imageScale(.small)
                }
                
                if !task.description.isEmpty {
                    Image(systemName: "doc.text")
                        .foregroundColor(.secondary)
                        .imageScale(.small)
                }
                
                if task.dueDate != nil {
                    if task.dueDate == Date() {
                        Image(systemName: "flag")
                            .foregroundColor(.red)
                            .imageScale(.small)
                    }
                    else {
                        Image(systemName: "flag")
                            .foregroundColor(.secondary)
                            .imageScale(.small)
                    }
                }
                
                if task.reminderDate != nil {
                    Image(systemName: "calendar.badge.clock")
                        .foregroundColor(.secondary)
                        .imageScale(.small)
                }
            }
        }
    }
}

struct TaskRowView_Previews: PreviewProvider {
    static var previews: some View {
        TaskRowView(task: TaskItem.example)
            .padding()
    }
}
