//
//  CreateListView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct CreateListView: View {
    
    @State private var listName = ""
    @State private var listColor = Color.accentColor
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var runtimeManager = RuntimeManager.shared
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Create New List")
                .font(.title3)
                .bold()
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
            
            ColorPicker("List Color", selection: $listColor)
            
            // Navigation Buttons
            
            HStack {
                Spacer()
                Button("Cancel") {
                    listName = ""
                    dismiss.callAsFunction()
                }
                .keyboardShortcut(.escape)
                Button("Done") {
                    runtimeManager.createList(listName: listName, color: listColor)
                    listName = ""
                    dismiss.callAsFunction()
                }
                .keyboardShortcut(.defaultAction)
                .disabled(listName.isEmpty)
            }
        }
        .padding()
        .frame(width: 400)
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
