//
//  ToDoItem.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation

struct ToDoItem: Identifiable {
    var id: String
    var name: String
    var isCompleted: Bool
    
    init() {
        self.id = UUID().uuidString
        self.name = "New To Do"
        self.isCompleted = false
    }
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.isCompleted = false
    }
}
