//
//  RETListWrapper.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-29.
//

import Foundation
import SwiftUI

/// The wrapper class for the `RETList` object.
class RETListWrapper: ObservableObject {
    
    // MARK: - WRAPPED OBJECT
    
    @Published var list: RETList
    
    // MARK: INITIALIZER
    
    init(_ list: RETList) {
        self.list = list
    }
    
    // MARK: - OBJECT HELPER FUNCTIONS
    
    public func remove(_ item: RETTask) {
        for i in 0..<list.items.count {
            if list.items[i].id == item.id {
                list.items.remove(at: i)
            }
        }
    }
    
    public func convertHex() -> Color {
        guard let accentColor = Color(hex: self.list.accentColor) else {
            return .accentColor
        }
        return accentColor
    }
    
    public func encode() -> [String: Any] {
        
        var tasksData: [String: Any] = [:]
        
        for item in self.list.items {
            tasksData.updateValue(RETTaskWrapper(item).encode(), forKey: item.id)
        }
        
        let listJSONData: [String: Any] = [
            self.list.id: [
                "name": self.list.name,
                "icon": self.list.icon,
                "accentColor": self.list.accentColor,
                "items": tasksData
            ] as [String: Any]
        ]
        
        return listJSONData
    }
}
