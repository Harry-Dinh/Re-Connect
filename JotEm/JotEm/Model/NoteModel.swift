//
//  NoteModel.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation

class NoteModel: ObservableObject {
    
    static let shared = NoteModel()
    
    @Published var noteTitle: String = ""
    @Published var noteBody: String = ""
    @Published var dateCreated: Date = Date()
    @Published var renameTitle: Bool = false
    
    var newNoteTitle: String = ""
}
