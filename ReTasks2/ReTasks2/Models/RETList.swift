//
//  RETList.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation
import SwiftUI

/// A list that holds to-do items
struct RETList: Identifiable, Codable {
    
    // MARK: FIELDS
    
    var id: String
    var name: String
    var color: String
    var items: [RETItem]
    var icon: String?
    
    // MARK: INITIALIZERS
    
    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.color = Color.accentColor.toHex()!
        self.items = []
        self.icon = nil
    }
    
    init(name: String, color: String, icon: String?) {
        self.id = UUID().uuidString
        self.name = name
        self.color = color
        self.items = []
        self.icon = icon
    }
    
    init(id: String, name: String, color: String, items: [RETItem], icon: String?) {
        self.id = id
        self.name = name
        self.color = color
        self.items = items
        self.icon = icon
    }
    
    // MARK: - PLACEHOLDER ITEM
    
    public static let placeholder = RETList(id: "000000000000",
                                            name: "Untitled List",
                                            color: Color.accentColor.toHex()!,
                                            items: [],
                                            icon: nil)
}
