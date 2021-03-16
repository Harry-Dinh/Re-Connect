//
//  DatabaseManager.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    private var database = Database.database().reference()
    
    public func uploadNotesToDatabase(with model: NoteModel) {
        database.child("Note created on: \(model.dateCreated)").setValue([
            "title": model.noteTitle,
            "body": model.noteBody
        ])
    }
}
