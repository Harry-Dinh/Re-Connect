//
//  CreateTaskView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct CreateTaskView: View {
    
    @State private var taskName = ""
    @State private var selectedList = RuntimeManager.shared.inbox.id
    @ObservedObject private var runtime = RuntimeManager.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Task name", text: $taskName)
                .textFieldStyle(.squareBorder)
            
            Picker("Add to", selection: $selectedList) {
                Text(runtime.inbox.name).tag(0)
                Text(runtime.todayList.name).tag(1)
                Divider()
                ForEach(runtime.userToDoLists) { list in
                    Text(list.name).tag(list.id)
                }
            }
            
            HStack {
                Spacer()
                
                Button(action: {
                    dismiss.callAsFunction()
                }) {
                    Text("Cancel")
                }
                .keyboardShortcut(.cancelAction)
                
                Button(action: {
                    // Call task creation function here...
                    dismiss.callAsFunction()
                }) {
                    Text("Create Task")
                }
                .keyboardShortcut(.defaultAction)
                .disabled(taskName.isEmpty)
            }
        }
        .padding()
        .frame(minWidth: 300, maxWidth: 300)
        .background(BlurredWindowBackgroundModifier())
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
            .padding()
            .frame(idealWidth: 300, idealHeight: 400)
    }
}
