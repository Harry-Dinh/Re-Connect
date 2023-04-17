//
//  ClassroomUser.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

/// Parent class of `Teacher` and `Student` objects.
protocol ClassroomUser: Identifiable {
    var id: String { get }
    var username: String { get set }
    var institutionURL: String { get }
    // var classes: [Classroom] { get set }
}
