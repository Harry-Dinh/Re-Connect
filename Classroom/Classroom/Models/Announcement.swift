//
//  Announcement.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-17.
//

import Foundation

struct Announcement: ClassPost {
    var id: String
    var owner: any ClassroomUser
    var datePosted: String
    
    func getID() -> String { return self.id }
    func getOwner() -> any ClassroomUser { return self.owner }
    func getDatePosted() -> String { return self.datePosted }
}
