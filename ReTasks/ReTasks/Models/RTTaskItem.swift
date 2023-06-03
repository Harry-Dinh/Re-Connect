//
//  RTTaskItem.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-05-31.
//

import Foundation

struct RTTaskItem: Identifiable {
    var id: String
    var title: String
    var notes: String
    var dateCreated: Date
    var dueDate: Date?
    var reminderDate: Date?
    var flagged: Bool
    
    init() {
        self.id = UUID().uuidString
        self.title = "Unnamed task"
        self.notes = ""
        self.dateCreated = Date()
        self.dueDate = nil
        self.reminderDate = nil
        self.flagged = false
    }
    
    init(title: String, dateCreated: Date) {
        self.id = UUID().uuidString
        self.title = title
        self.notes = ""
        self.dateCreated = dateCreated
        self.dueDate = nil
        self.reminderDate = nil
        self.flagged = false
    }
    
    init(id: String, title: String, notes: String, dateCreated: Date, dueDate: Date?, reminderDate: Date?, flagged: Bool) {
        self.id = id
        self.title = title
        self.notes = notes
        self.dateCreated = dateCreated
        self.dueDate = dueDate
        self.reminderDate = reminderDate
        self.flagged = flagged
    }
    
    public static let placeholderTask = RTTaskItem(id: UUID().uuidString,
                                                   title: "Buy milk",
                                                   notes: "At the grocery store",
                                                   dateCreated: Date(),
                                                   dueDate: Date(),
                                                   reminderDate: Date(),
                                                   flagged: true)
}
