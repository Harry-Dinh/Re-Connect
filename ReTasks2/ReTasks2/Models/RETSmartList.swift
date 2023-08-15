//
//  RETSmartList.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation
import SwiftUI

struct RETSmartList {
    var name: String
    var icon: String
    var color: Color
    var items: [RETItem]
    
    public static let placeholder = RETSmartList(name: "Inbox", icon: "tray", color: .accentColor, items: [])
}
