//
//  ToDoList.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation
import SwiftUI

struct ToDoList: Identifiable {
    var id: String
    var name: String
    var color: Color
    var todos: [ToDoItem]
    var isCoreList: Bool
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.color = Color.accentColor
        self.todos = []
        self.isCoreList = false
    }
    
    init(name: String, color: Color) {
        self.id = UUID().uuidString
        self.name = name
        self.color = color
        self.todos = []
        self.isCoreList = false
    }
    
    public mutating func setCoreList(isCoreList: Bool) {
        self.isCoreList = isCoreList
    }
    
    public static let example = ToDoList(name: "Groceries", color: Color.cyan)
}
