//
//  RETList.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-30.
//

import Foundation
import SwiftUI

class RETList: Identifiable {
    var id: String
    var name: String
    var icon: String
    var hexColor: String
    
    init() {
        self.id = UUID().uuidString
        self.name = "Untitled List"
        self.icon = CUPSystemIcon.menuList
        
        guard let hexColor = Color.accentColor.toHex() else { return }
        self.hexColor = hexColor
    }
}
