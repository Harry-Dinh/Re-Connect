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
    
    @Published var selectedPrivacy: Int = 0
    
    // Post
    @Published var postTitle: String = ""
    @Published var postBody: String = ""
    @Published var postPhoto: Image?
    @Published var addMedia: Bool = false
    
    // Story
    @Published var storyTitle: String = ""
    @Published var storyPhoto: Image?
}
