//
//  SidebarView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import SwiftUI

struct SidebarView: View {
    
    @ObservedObject private var viewModel = SidebarViewVM.viewModel
    
    var body: some View {
        VStack {
            if !viewModel.folders.isEmpty {
                List {
                    ForEach(viewModel.folders) { folder in
                        Label(folder.name, systemImage: CUPSystemIcon.folder)
                    }
                }
                .listStyle(.sidebar)
            } else {
                Text("No folders yet.\nClick the \(Image(systemName: CUPSystemIcon.newFolder)) button to create one")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .foregroundColor(.secondary)
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {
                    viewModel.showCreateFolderView.toggle()
                }) {
                    Image(systemName: CUPSystemIcon.newFolder)
                }
            }
        }
        .sheet(isPresented: $viewModel.showCreateFolderView, content: CreateFolderView.init)
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
