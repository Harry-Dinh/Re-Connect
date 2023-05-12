//
//  MenuScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

class MenuScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = MenuScreenVM()
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    /// The default section of menus
    public let contentSectionItems: [RECListRowItem] = [
        RECListRowItem(label: "Followers", iconStr: "person.2", tintColor: .accentColor),
        RECListRowItem(label: "Following", iconStr: "person.3", tintColor: .accentColor),
        RECListRowItem(label: "Bookmarks", iconStr: "book.closed", tintColor: .orange)
    ]
    
    public var userCollectionFolders: [RECListRowItem] = []
}
