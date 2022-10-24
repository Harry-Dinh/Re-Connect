//
//  ObjectManager.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import Foundation

class ObjectManager: ObservableObject {
    static let current = ObjectManager()
    
    public var userLists: [ListItem] = []
    
    public var systemLists: [ListItem] = [
        ListItem(id: "0001", name: "Inbox", icon: "📥", tasks: []),
        ListItem(id: "0002", name: "Today", icon: "📅", tasks: []),
        ListItem(id: "0003", name: "Upcoming", icon: "🗓", tasks: []),
        ListItem(id: "0004", name: "Deadlines", icon: "‼️", tasks: [])
    ]
}
