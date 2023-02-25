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
    
    @Published var userToDoLists: [ToDoList] = []
    
    // MARK: CORE LISTS
    
    @Published var inbox: ToDoList = ToDoList(name: "Inbox", color: Color.accentColor)
    @Published var todayList: ToDoList = ToDoList(name: "Today", color: Color.accentColor)
    
    /// The list of the row selected on the sidebar
    @Published var selectedSidebarRow: ToDoList? = nil
    
    public func createList(listName: String, color: Color) {
        let list = ToDoList(name: listName, color: color)
        userToDoLists.append(list)
        print("Item added successfully")
    }
    
    public func refreshListArray() {
        let list = userToDoLists
        userToDoLists = []
        userToDoLists = list
        print("Refreshed the array")
    }
    
    public func setSelectedList(list: ToDoList) {
        selectedSidebarRow = list
        print("assigned new selected list")
    }
    
    public func removeList(list: ToDoList) {
        for i in 0..<userToDoLists.count {
            if userToDoLists[i].id == list.id {
                userToDoLists.remove(at: i)
            }
        }
    }
    
    // MARK: - ON_APPEAR() CALLS
    
    /// Turning the inbox and today lists into core lists
    public static func setCoreList() {
        RuntimeManager.shared.inbox.setCoreList(isCoreList: true)
        RuntimeManager.shared.todayList.setCoreList(isCoreList: true)
    }
}
