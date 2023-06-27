//
//  NewFolderScreen.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import SwiftUI

struct NewFolderScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var folderSidebarVM = FolderSidebarVM.viewModel
    @State private var folderName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Folder name", text: $folderName)
            }
            .navigationTitle("New Folder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss.callAsFunction()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        let newFolder = ARTFolder(name: folderName)
                        folderSidebarVM.folders.append(newFolder)
                        dismiss.callAsFunction()
                        folderName = ""
                    }) {
                        Text("Create")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct NewFolderScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewFolderScreen()
    }
}
