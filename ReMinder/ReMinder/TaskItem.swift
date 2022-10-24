//
//  TaskItem.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import Foundation
import SwiftUI

struct TaskItem: Identifiable {
    var id: String
    var title: String
    var description: String
    var isFlagged: Bool
    var reminderDate: Date?
    var dueDate: Date?
    
    public let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    @State static var example = TaskItem(id: UUID().uuidString, title: "Write a happy birthday letter", description: "For mom's 49th birthday", isFlagged: true, reminderDate: Date(), dueDate: Date())
}
