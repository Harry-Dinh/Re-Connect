//
//  RuntimeManager.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation

class RuntimeManager: ObservableObject {
    public static let shared = RuntimeManager()
    
    public var todoLists: [ToDoList] = []
    
    public func createList(listName: String) {
        let list = ToDoList(name: listName)
        todoLists.append(list)
        print("Item added successfully")
    }
    
    public func refreshListArray() {
        let list = todoLists
        todoLists = list
        print("Refreshed the array")
    }
}
