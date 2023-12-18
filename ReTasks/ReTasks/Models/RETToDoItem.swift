//
//  RETToDoItem.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-12-17.
//

import Foundation

/// An object that represents a to do item
struct RETToDoItem: Identifiable {
    
    // MARK: - PROPERTIES
    
    /// The unique ID of the item
    var id: String
    
    /// The name of the item
    var name: String
    
    /// The notes accompanying the item
    var notes: String
    
    /// A boolean that tells if this to-do is flagged or not
    var isFlagged: Bool
    
    /// An optional date object that holds the date to remind if the user decides to add it
    var remindDate: Date?
    
    /// An optional date object that holds the due date of this task if he user decides to add it
    var dueDate: Date?
    
    /// The unique ID of the parent (list) that contains this to do item
    var parentID: String?
    
    
    // MARK: - INITIALIZERS
    
    
    /// Initializes an empty to do item whose values are set to the default.
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled task"
        self.notes = ""
        self.isFlagged = false
        self.remindDate = nil
        self.dueDate = nil
        self.parentID = nil
    }
    
    
    /// Initialize a standard to do item (use this to **quickly add a task** into the inbox or a specified list)
    init(name: String, isFlagged: Bool, remindDate: Date?, dueDate: Date?, parentID: String?) {
        self.id = UUID().uuidString
        self.name = name
        self.notes = ""
        self.isFlagged = isFlagged
        self.remindDate = remindDate
        self.dueDate = dueDate
        self.parentID = parentID
    }
    
    
    /// Fully initialize a to do item (use this to **initialize existing to do items** fetched from the database)
    init(id: String, name: String, notes: String, isFlagged: Bool, remindDate: Date?, dueDate: Date?, parentID: String?) {
        self.id = id
        self.name = name
        self.notes = notes
        self.isFlagged = isFlagged
        self.remindDate = remindDate
        self.dueDate = dueDate
        self.parentID = parentID
    }
    
    
    // MARK: - PLACEHOLDER ITEM
    
    
    public static let placeholder = RETToDoItem(id: "00010011",
                                                name: "Generic Task",
                                                notes: "Some generic description of this item.",
                                                isFlagged: true,
                                                remindDate: Date(),
                                                dueDate: Date(),
                                                parentID: nil)
}
