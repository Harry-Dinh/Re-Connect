//
//  CreateFolderView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import SwiftUI

struct CreateFolderView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var sidebarVM = SidebarViewVM.viewModel
    
    @State private var folderName = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Create New Folder")
                .font(.title3)
                .fontWeight(.bold)
            TextField("Folder name", text: $folderName)
                .textFieldStyle(.roundedBorder)
            
            HStack {
                Spacer()
                
                Button(action: {
                    dismiss.callAsFunction()
                    folderName = ""
                }) {
                    Text("Cancel")
                }
                .keyboardShortcut(.cancelAction)
                
                Button(action: {
                    let folder = ARTFolder(name: folderName)
                    sidebarVM.folders.append(folder)
                    dismiss.callAsFunction()
                    folderName = ""
                }) {
                    Text("Create Folder")
                }
                .keyboardShortcut(.defaultAction)
            }
        }
        .frame(width: 300)
        .padding()
    }
}

struct CreateFolderView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFolderView()
    }
}
