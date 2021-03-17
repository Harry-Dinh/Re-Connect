//
//  NoteModel.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
import SwiftUI

class NoteModel: ObservableObject {
    
    static let shared = NoteModel()
    
    @Published var noteTitle: String = "Untitled"
    @Published var noteBody: String = "This is the body of the note, delete this placeholder and replace it with your own ideas!"
    @Published var dateCreated: Date = Date()
    @Published var renameTitle: Bool = false
    
    var newNoteTitle: String = ""
}
