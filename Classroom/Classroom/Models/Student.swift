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
    var emailAddress: String
    var classes: [Classroom]
    
    /*========= STUDENT EXCLUSIVE ATTRIBUTES ==========*/
    
    private var currentLevel: Int
    private var currentSemester: String
    private var currentGrade: Double
    
    func getID() -> String { return self.id }
    func getUsername() -> String { return self.username }
    func getinstitutionURL() -> String { return self.institutionURL }
    func getClasses() -> [Classroom] { return self.classes }
    public func getCurrentLevel() -> Int { return self.currentLevel }
    public func getCurrentSemester() -> String { return self.currentSemester }
    public func getCurrentGrade() -> Double { return self.currentGrade }
    
    mutating func setUsername(username: String) { self.username = username }
    mutating func setEmail(emailAddress: String) { self.emailAddress = emailAddress }
    public mutating func setCurrentLevel(currentLevel: Int) { self.currentLevel = currentLevel }
    public mutating func setCurrentSemester(currentSemester: String) { self.currentSemester = currentSemester }
    public mutating func setCurrentGrade(currentGrade: Double) { self.currentGrade = currentGrade }
}
