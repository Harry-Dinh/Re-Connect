//
//  ClassPost.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

/// The parent class of the objects that would be represented as a post in a virtual classroom.
protocol ClassPost: Identifiable {
    var id: String { get }
    var owner: any ClassroomUser { get }
    var datePosted: String { get }
    
    /// Return the unique identifier of this post.
    func getID() -> String
    
    /// Return the owner object of this post.
    func getOwner() -> any ClassroomUser
    
    /// Return the date that this post was posted (in a `String` not a `Date` object.
    func getDatePosted() -> String
}
