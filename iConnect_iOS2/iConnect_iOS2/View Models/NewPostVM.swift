//
//  NewPostVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-03.
//

import SwiftUI
import FirebaseFirestore

class NewPostVM: ObservableObject {
    static let shared = NewPostVM()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    @Published var storyOrPost: Bool = false
    @Published var showNewPost: Bool = false
    @Published var postTitleField: String = ""
    @Published var postBodyField: String = ""
    @Published var addMedia: Bool = false
}
