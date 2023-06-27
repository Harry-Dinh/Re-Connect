//
//  FolderSidebarVM.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import Foundation

class FolderSidebarVM: ObservableObject {
    public static let viewModel = FolderSidebarVM()
    
    @Published var folders: [ARTFolder] = []
    
    @Published var presentNewFolderScreen = false
}
