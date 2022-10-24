//
//  ListItem.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import SwiftUI
import Foundation

struct ListItem: Identifiable {
    var id: String
    var name: String
    var icon: String
    var tasks: [TaskItem]
    
    @State static var example = ListItem(id: UUID().uuidString, name: "Personal", icon: "😅", tasks: [])
}
