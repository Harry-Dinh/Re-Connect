//
//  NewPostVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import SwiftUI

class NewPostVM: ObservableObject {
    static let shared = NewPostVM()
    
    private init() {}
    
    @Published var storyOrPost: Bool = false
    
    @Published var selectedPrivacy: SelectedPostAudience = .visibleToFollowers
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // Post
    @Published var postTitle: String = ""
    @Published var postBody: String = ""
    @Published var postPhoto: Image?
    @Published var addMedia: Bool = false
    
    // Story
    @Published var storyTitle: String = ""
    @Published var storyPhoto: Image?
}

enum SelectedPostAudience: String, CaseIterable {
    case visibleToPublic = "Visible to Public"
    case visibleToFollowers = "Visible to Followers"
    case visibleToNoOne = "No One"
    case selectedPeople = "Select People to View"
}
