//
//  FolderDetailView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import SwiftUI

struct FolderDetailView: View {
    
    var folder: ARTFolder
    
    @State private var presentAddLinkAlert = false
    
    @State private var urlField = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(folder.urls, id: \.self) { url in
                    Label(url, systemImage: "link")
                }
            }
            .navigationTitle(folder.name)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button(action: {
                        presentAddLinkAlert.toggle()
                    }) {
                        Image(systemName: "link.badge.plus")
                    }
                    
                    Menu {
                        EditButton()
                        Divider()
                        Button(action: {}) {
                            Label("Rename", systemImage: CUPSystemIcon.edit)
                        }
                        Button(role: .destructive, action: {}) {
                            Label("Delete", systemImage: CUPSystemIcon.delete)
                        }
                    } label: {
                        Image(systemName: CUPSystemIcon.moreMenu)
                            .symbolVariant(.circle)
                    }
                }
            }
            .alert("Add Link", isPresented: $presentAddLinkAlert) {
                TextField("Paste or enter link here...", text: $urlField)
                Button("Cancel", role: .cancel, action: {})
                Button("Add") {
                    
                }
            }
        }
    }
}

struct FolderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FolderDetailView(folder: ARTFolder.placeholder)
    }
}
