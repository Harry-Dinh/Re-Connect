//
//  RuntimeManager.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation

class RuntimeManager: ObservableObject {
    public static let shared = RuntimeManager()
    
    @Published var todoLists: [ToDoList] = []
    
    public func createList(listName: String) {
        let list = ToDoList(name: listName)
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
