//
//  RECListRowItem.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct RECListRowItem: Identifiable {
    var id: String
    var label: String
    var iconStr: String?
    var tintColor: Color?
    
    init(label: String, iconStr: String?) {
        self.id = UUID().uuidString
        self.label = label
        self.iconStr = iconStr
        self.tintColor = nil
    }
    
    init(label: String, iconStr: String?, tintColor: Color?) {
        self.id = UUID().uuidString
        self.label = label
        self.iconStr = iconStr
        self.tintColor = tintColor
    }
    
    init(label: String) {
        self.id = UUID().uuidString
        self.label = label
        self.iconStr = nil
        self.tintColor = nil
    }
    
    /// The placeholder item for a menu row.
    public static let placeholderItem = RECListRowItem(label: "General", iconStr: "gear", tintColor: .gray)
}
