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
    
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
    
    // MARK: - OBJECT HELPER FUNCTIONS
    
//    public func encode() -> Data {
//        let encoder = JSONEncoder()
//        let taskData: Data
//
//        do {
//            taskData = try encoder.encode(self.task)
//            return taskData
//        } catch {
//            print("Cannot encode task item")
//        }
//        return Data()
//    }
}
