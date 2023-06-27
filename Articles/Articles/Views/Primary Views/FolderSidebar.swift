//
//  FolderSidebar.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import SwiftUI

struct FolderSidebar: View {
    
    @ObservedObject private var viewModel = FolderSidebarVM.viewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.folders.isEmpty {
                    Text("No Folders")
                        .font(.title2)
                        .foregroundColor(.secondary)
                } else {
                    List {
                        ForEach(viewModel.folders) { folder in
                            NavigationLink(destination: FolderDetailView(folder: folder)) {
                                Label(folder.name, systemImage: "folder")
                            }
                        }
                    }
                    .listStyle(.sidebar)
                }
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        viewModel.presentNewFolderScreen.toggle()
                    }) {
                        Image(systemName: CUPSystemIcon.newFolder)
                    }
                }
            }
            .navigationTitle("Articles")
            .sheet(isPresented: $viewModel.presentNewFolderScreen, content: NewFolderScreen.init)
        }
    }
}

struct FolderSidebar_Previews: PreviewProvider {
    static var previews: some View {
        FolderSidebar()
    }
}
