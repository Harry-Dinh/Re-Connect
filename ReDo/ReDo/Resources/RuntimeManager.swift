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
    @Published var todayList: ToDoList = ToDoList(name: "Today", color: Color.accentColor)
    
    /// The list of the row selected on the sidebar
    @Published var selectedSidebarRow: ToDoList? = nil
    
    public var inboxID: String = ""
    public var todayID: String = ""
    
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
    
    public func setSelectedList(list: ToDoList) {
        selectedSidebarRow = list
        print("assigned new selected list")
    }
    
    // MARK: - onAppear() calls
    
    /// Turning the inbox and today lists into core lists
    public static func setCoreList() {
        RuntimeManager.shared.inbox.setCoreList(isCoreList: true)
        RuntimeManager.shared.todayList.setCoreList(isCoreList: true)
    }
}
