//
//  RETList.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-30.
//

import Foundation
import SwiftUI

struct RETList: Identifiable {
    var id: String
    var name: String
    var icon: String
    var hexColor: String
    var items: [RETItem]
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.icon = CUPSystemIcon.menuList
        self.hexColor = Color.accentColor.toHex()!
        self.items = []
    }
    
    init(name: String, icon: String) {
        self.id = UUID().uuidString
        self.name = name
        self.icon = icon
        self.hexColor = Color.accentColor.toHex()!
        self.items = []
    }
    
    init(id: String, name: String, icon: String, hexColor: String, items: [RETItem]) {
        self.id = id
        self.name = name
        self.icon = icon
        self.hexColor = hexColor
        self.items = items
    }
    
    public static let placeholder = RETList(id: "00000000000000",
                                            name: "Grocery List",
                                            icon: CUPSystemIcon.shoppingCart,
                                            hexColor: "007AFF",
                                            items: [RETItem.placeholder])
}
