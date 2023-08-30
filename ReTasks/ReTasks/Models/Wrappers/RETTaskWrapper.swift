//
//  RETTaskWrapper.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-29.
//

import Foundation

/// A wrapper class for the `RETTask` object.
class RETTaskWrapper: ObservableObject {
    
    // MARK: - WRAPPED OBJECT
    
    @Published var task: RETTask
    
    // MARK: - INITIALIZER
    
    init(_ task: RETTask) {
        self.task = task
    }
    
    // MARK: - OBJECT HELPER PROPERTIES
    
    @Published var remindDate = Date()
    
    @Published var dueDate = Date()
    
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
    
    // MARK: - OBJECT HELPER FUNCTIONS
    
    public func encode() -> [String: Any] {
        let taskJSONData: [String: Any] = [
            "title": self.task.title,
            "notes": self.task.notes,
            "isCompleted": self.task.isCompleted,
            "flagged": self.task.flagged,
            "dueDate": self.task.dueDate ?? RETTaskWrapper.dateFormatter.string(from: Date()),
            "remindDate": self.task.remindDate ?? RETTaskWrapper.dateFormatter.string(from: Date())
        ]
        
        return taskJSONData
    }
}
