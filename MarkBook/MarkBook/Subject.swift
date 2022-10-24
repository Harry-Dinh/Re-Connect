//
//  Subject.swift
//  MarkBook
//
//  Created by Harry Dinh on 2022-10-14.
//

import Foundation
import SwiftUI

struct Subject: Identifiable {
    var id: String
    var name: String
    var color: Color
    var progress: Double
    
    static let example = Subject(id: UUID().uuidString, name: "MATH 1007-A", color: .cyan, progress: 84.4)
}
