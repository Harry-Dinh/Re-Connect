//
//  SidebarViewVM.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import Foundation

class SidebarViewVM: ObservableObject {
    static let viewModel = SidebarViewVM()
    
    @Published var folders: [ARTFolder] = []
    
    @Published var showCreateFolderView = false
}
