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
    var emailAddress: String { get set }
    var classes: [Classroom] { get set }
    
    /// Return the unique identifier of this user.
    func getID() -> String
    
    /// Return the username of this user.
    func getUsername() -> String
    
    /// Return the institution URL of this user (as a `String` not `URL`.)
    func getinstitutionURL() -> String
    
    /// Return the list of classes belong to this user.
    func getClasses() -> [Classroom]
    
    /// Set a new username for this user
    /// - Parameter username: The new username
    mutating func setUsername(username: String)
    
    /// Change the current email address of this user
    /// - Parameter emailAddress: The new email address
    mutating func setEmail(emailAddress: String)
}
