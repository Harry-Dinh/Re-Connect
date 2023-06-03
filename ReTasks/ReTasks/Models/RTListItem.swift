//
//  RTListItem.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-03.
//

import SwiftUI

struct RTListItem: Identifiable {
    var id: String
    var name: String
    var symbolName: String
    var accentColor: Color
    var taskItems: [RTTaskItem]
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.symbolName = CUPSystemIcon.genericList
        self.accentColor = .accentColor
        self.taskItems = []
    }
    
    init(name: String, symbolname: String, accentColor: Color) {
        self.id = UUID().uuidString
        self.name = name
        self.symbolName = symbolname
        self.accentColor = accentColor
        self.taskItems = []
    }
    
    init(id: String, name: String, symbolName: String, accentColor: Color, taskItems: [RTTaskItem]) {
        self.id = id
        self.name = name
        self.symbolName = symbolName
        self.accentColor = accentColor
        self.taskItems = taskItems
    }
    
    public static let placeholderList = RTListItem(id: UUID().uuidString,
                                                   name: "Grocery List",
                                                   symbolName: CUPSystemIcon.shoppingCart,
                                                   accentColor: .accentColor,
                                                   taskItems: [RTTaskItem.placeholderTask])
}
