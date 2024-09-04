//
//  RECPost.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-09-04.
//

import Foundation
import SwiftUI

/// A structure that represents a post in Re:Connect
struct RECPost: Identifiable {
    var id: String
    var originalPoster: RECUser
    var type: RECPostType
    var content: AnyObject?
    // var datePosted: Date?    Need to implement this later!
    
    var commentCount: Int
    var likeCount: Int
    var shareCount: Int

    //    var comments: [RECPostComment]    This will be implemented in the future!
    
    // Default initializer
    init() {
        self.id = UUID().uuidString
        self.originalPoster = RECUser.placeholderUser
        self.type = .other
        self.content = nil
        self.commentCount = 0
        self.likeCount = 0
        self.shareCount = 0
    }
    
    // New post initializer (use this when creating a new post)
    init(type: RECPostType, content: AnyObject?, poster: RECUser) {
        self.id = UUID().uuidString
        self.originalPoster = poster
        self.type = type
        self.content = content
        self.commentCount = 0
        self.likeCount = 0
        self.shareCount = 0
    }
    
    // Existing post constructor (use this when fetching existing posts from the server)
    init(id: String, poster: RECUser, type: RECPostType, content: AnyObject?, commentCount: Int, likeCount: Int, shareCount: Int) {
        self.id = id
        self.originalPoster = poster
        self.type = type
        self.content = content
        self.commentCount = commentCount
        self.likeCount = likeCount
        self.shareCount = shareCount
    }
    
    public static let placeholder = RECPost(id: "0000000000000000",
                                            poster: RECUser.placeholderUser,
                                            type: .text,
                                            content: nil,
                                            commentCount: 10,
                                            likeCount: 20,
                                            shareCount: 30)
}
