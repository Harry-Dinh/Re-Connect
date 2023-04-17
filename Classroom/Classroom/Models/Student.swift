//
//  Student.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

/// An object representing the user who has the role and attributes of a student.
struct Student: ClassroomUser, Identifiable {
    
    /*========= ATTRIBUTES INHERITED FROM CLASSROOM_USER ==========*/
    
    var id: String
    var username: String
    var institutionURL: String
    // var classes: [Classroom]
    
    /*========= STUDENT EXCLUSIVE ATTRIBUTES ==========*/
    
    var currentLevel: Int
    var currentSemester: Int
    var currentGrade: Double
}
