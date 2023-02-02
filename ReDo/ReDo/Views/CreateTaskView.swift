//
//  CreateTaskView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-21.
//

import SwiftUI

struct CreateTaskView: View {
    
    @State private var taskName = ""
    @ObservedObject private var runtime = RuntimeManager.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            TextField("Task name", text: $taskName)
            
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
    }
}

struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
            .padding()
            .frame(idealWidth: 300, idealHeight: 400)
    }
}
