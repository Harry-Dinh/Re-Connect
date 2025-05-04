//
//  MenuScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

class MenuScreenVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let instance = MenuScreenVM()
    
    // MARK: - SWIFTUI VIEWS PROPERTIES
    
    /// The default section of menus
    public let contentSectionItems: [RECListRowItem] = [
        RECListRowItem(label: "Followers", iconStr: "person.2", tintColor: .accentColor),
        RECListRowItem(label: "Following", iconStr: "person.2", tintColor: .accentColor),
        RECListRowItem(label: "Bookmarks", iconStr: "bookmark", tintColor: .orange)
    ]
    
    public let applicationSectionItems: [RECListRowItem] = [
        RECListRowItem(label: "Settings", iconStr: "gear", tintColor: .gray),
        RECListRowItem(label: "Feedback & Support", iconStr: "questionmark.bubble", tintColor: .gray),
        RECListRowItem(label: "About Re:Connect", iconStr: "info.circle", tintColor: .gray)
    ]
    
    public var userCollectionFolders: [RECListRowItem] = []
}
