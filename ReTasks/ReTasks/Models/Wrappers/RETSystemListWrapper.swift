//
//  RETSystemListWrapper.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import Foundation

class RETSystemListWrapper: ObservableObject {
    
    // MARK: - WRAPPED OBJECT
    
    @Published var systemList: RETSystemList
    
    // MARK: - INITIALIZER
    
    init(_ systemList: RETSystemList) {
        self.systemList = systemList
    }
    
    // MARK: - FUNCTIONS
    
    public func encode() -> [String: Any] {
        
        var tasksData: [String: Any] = [:]
        
        for item in self.systemList.items {
            tasksData.updateValue(RETTaskWrapper(item).encode(), forKey: item.id)
        }
        
        let listJSONData: [String: Any] = [
            self.systemList.id: [
                "name": self.systemList.name,
                "icon": self.systemList.icon,
                "accentColor": self.systemList.accentColor,
                "items": tasksData
            ] as [String: Any]
        ]
        
        return listJSONData
    }
}
