//
//  Classroom.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

/// An object that represents the virtual classroom
struct Classroom: Identifiable {
    var id: String
    private var name: String
    private var accentColor: String
    private var classCode: String
    private var classPosts: [any ClassPost]
}
