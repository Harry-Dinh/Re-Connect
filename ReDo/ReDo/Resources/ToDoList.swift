//
//  ToDoList.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation

struct ToDoList: Identifiable {
    var id: String
    var name: String
    var todos: [ToDoItem]
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.todos = []
    }
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
        self.todos = []
    }
}
