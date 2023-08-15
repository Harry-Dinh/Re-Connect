//
//  RETItem.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation

/// A to-do list item
struct RETItem: Identifiable, Codable {
    
    // MARK: - FIELDS
    
    var id: String
    var name: String
    var notes: String
    var isCompleted: Bool
    var flagged: Bool
    var dueDate: String?
    var remindDate: String?
    
    // MARK: - INITIALIZERS
    
    init() {
        self.id = UUID().uuidString
        self.name = "New Task"
        self.notes = ""
        self.isCompleted = false
        self.flagged = false
        self.dueDate = nil
        self.remindDate = nil
    }
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.notes = ""
        self.isCompleted = false
        self.flagged = false
        self.dueDate = nil
        self.remindDate = nil
    }
    
    init(name: String, notes: String) {
        self.id = UUID().uuidString
        self.name = name
        self.notes = notes
        self.isCompleted = false
        self.flagged = false
        self.dueDate = nil
        self.remindDate = nil
    }
    
    init(id: String, name: String, notes: String, isCompleted: Bool, flagged: Bool, dueDate: String?, remindDate: String?) {
        self.id = id
        self.name = name
        self.notes = notes
        self.isCompleted = isCompleted
        self.flagged = flagged
        self.dueDate = dueDate
        self.remindDate = remindDate
    }
    
    // MARK: - PLACEHOLDER ITEM
    
    public static let placeholder = RETItem(id: "0000000000",
                                            name: "New Task",
                                            notes: "",
                                            isCompleted: false,
                                            flagged: false,
                                            dueDate: nil,
                                            remindDate: nil)
}
