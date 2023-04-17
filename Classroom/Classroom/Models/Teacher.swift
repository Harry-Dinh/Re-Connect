//
//  Teacher.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

/// An object representing the user who has the role and attributes of a teacher.
struct Teacher: ClassroomUser, Identifiable {
    
    /*========= ATTRIBUTES INHERITED FROM CLASSROOM_USER ==========*/
    
    var id: String
    var username: String
    var institutionURL: String
    var emailAddress: String
    var classes: [Classroom]
    
    func getID() -> String { return self.id }
    func getUsername() -> String { return self.username }
    func getinstitutionURL() -> String { return self.institutionURL }
    func getClasses() -> [Classroom] { return self.classes }
    
    mutating func setUsername(username: String) { self.username = username }
    mutating func setEmail(emailAddress: String) { self.emailAddress = emailAddress }
}
