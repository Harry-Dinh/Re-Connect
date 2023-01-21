//
//  RuntimeManager.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation
import SwiftUI

class RuntimeManager: ObservableObject {
    public static let shared = RuntimeManager()
    
    @Published var todoLists: [ToDoList] = []
    @Published var inbox: ToDoList = ToDoList(name: "Inbox", color: Color.accentColor)
    
    public func createList(listName: String, color: Color) {
        let list = ToDoList(name: listName, color: color)
        todoLists.append(list)
        print("Item added successfully")
    }
    
    public func printlist() {
        print(todoLists)
    }
    
    public func refreshListArray() {
        let list = todoLists
        todoLists = []
        todoLists = list
        print("Refreshed the array")
    }
}
