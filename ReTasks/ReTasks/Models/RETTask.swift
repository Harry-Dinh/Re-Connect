//
//  RETTask.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation

struct RETTask: Identifiable {
    var id: String
    var title: String
    var notes: String
    var isCompleted: Bool
    var flagged: Bool
    var dueDate: Date?
    var remindDate: Date?
    
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter
    }()
}
