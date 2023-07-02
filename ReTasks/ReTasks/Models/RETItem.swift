//
//  RETItem.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-07-02.
//

import Foundation

struct RETItem: Identifiable {
    var id: String
    var title: String
    var notes: String?
    var dueDate: Date?
    var remindDate: Date?
    var isFlagged: Bool
    
    init() {
        self.id = UUID().uuidString
        self.title = "Untitled Task"
        self.notes = nil
        self.dueDate = nil
        self.remindDate = nil
        self.isFlagged = false
    }
    
    init(id: String, title: String, notes: String?, dueDate: Date?, remindDate: Date?, isFlagged: Bool) {
        self.id = id
        self.title = title
        self.notes = notes
        self.dueDate = dueDate
        self.remindDate = remindDate
        self.isFlagged = isFlagged
    }
    
    public static let placeholder = RETItem(id: "00000000000",
                                            title: "Buy milk",
                                            notes: nil,
                                            dueDate: nil,
                                            remindDate: Date(),
                                            isFlagged: false)
}
