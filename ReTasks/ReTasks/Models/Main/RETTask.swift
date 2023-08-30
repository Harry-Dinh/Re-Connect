//
//  RETTask.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation

/// An object that represent a to-do item in Re:Tasks
struct RETTask: Identifiable, Codable {
    
    // MARK: - FIELDS
    
    var id: String
    var title: String
    var notes: String
    var isCompleted: Bool
    var flagged: Bool
    var dueDate: String?
    var remindDate: String?
    
    // MARK: - INITIALIZERS
    
    init() {
        self.id = UUID().uuidString
        self.title = "Untitled task"
        self.notes = ""
        self.isCompleted = false
        self.flagged = false
        self.dueDate = nil
        self.remindDate = nil
    }
    
    init(id: String, title: String, notes: String) {
        self.id = id
        self.title = title
        self.notes = notes
        self.isCompleted = false
        self.flagged = false
        self.dueDate = nil
        self.remindDate = nil
    }
    
    // MARK: - PLACEHOLDER OBJECT
    
    public static let placeholder = RETTask()
}
