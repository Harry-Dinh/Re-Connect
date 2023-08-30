//
//  RETList.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-29.
//

import Foundation
import SwiftUI

/// An object that represents a to-do list.
struct RETList: Identifiable, Codable {
    
    // MARK: - FIELDS
    
    var id: String
    var name: String
    var icon: String
    var accentColor: String
    var items: [RETTask]
    
    // MARK: - INITIALIZERS
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.icon = "list.bullet"
        self.accentColor = Color.accentColor.toHex()!
        self.items = []
    }
    
    init(id: String, name: String, icon: String, accentColor: String) {
        self.id = id
        self.name = name
        self.icon = icon
        self.accentColor = accentColor
        self.items = []
    }
    
    // MARK: - PLACEHOLDER OBJECT
    
    public static let placeholder = RETList()
}
