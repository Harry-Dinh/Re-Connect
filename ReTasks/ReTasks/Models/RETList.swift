//
//  RETList.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-18.
//

import Foundation
import SwiftUI

/// An object that represent a list containing to-do items
struct RETList: Identifiable {
    
    // MARK: - PROPERTIES
    
    /// The unique identifier of this list.
    var id: String
    
    /// The name of this list.
    var name: String
    
    /// An array of `RETToDoItem` that holds the to-do items of this list (the item's `parentID` field must be the same as the list's `id` field.
    var items: [RETToDoItem]
    
    /// The accent color of this list (when writing to the database it will be stored as a hex string)
    var color: Color?
    
    /// The SF Symbol string icon of this list (always stored as a string and can be interpreted into icons by SwiftUI)
    var icon: String?
    
    
    // MARK: - INITIALIZERS
    
    
    /// Create an empty list with all fields set to default values
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.items = []
        self.color = .accentColor
        self.icon = "list.bullet"
    }
    
    
    /// Create a standard list (use this when **creating a list for the first time**)
    init(name: String, color: Color?, icon: String?) {
        self.id = UUID().uuidString
        self.name = name
        self.items = []
        self.color = color
        self.icon = icon
    }
    
    
    /// Fully initialize a list (use this when **assigning existing list data from the database**)
    init(id: String, name: String, items: [RETToDoItem], color: Color?, icon: String?) {
        self.id = id
        self.name = name
        self.items = items
        self.color = color
        self.icon = icon
    }
    
    
    // MARK: - PLACEHOLDER ITEM
    
    
    public static let placeholder = RETList(id: "SDF2WFJ1ISN3", name: "My List", items: [], color: .accentColor, icon: nil)
}
