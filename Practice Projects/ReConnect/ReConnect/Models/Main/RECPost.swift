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
    var content: Any?
    var datePosted: Date
    
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
        self.datePosted = Date()
    }
    
    // New post initializer (use this when creating a new post)
    init(type: RECPostType, content: Any?, poster: RECUser) {
        self.id = UUID().uuidString
        self.originalPoster = poster
        self.type = type
        self.content = content
        self.commentCount = 0
        self.likeCount = 0
        self.shareCount = 0
        self.datePosted = Date()
    }
    
    // Existing post constructor (use this when fetching existing posts from the server)
    init(id: String, poster: RECUser, type: RECPostType, content: Any?, commentCount: Int, likeCount: Int, shareCount: Int, datePosted: Date) {
        self.id = id
        self.originalPoster = poster
        self.type = type
        self.content = content
        self.commentCount = commentCount
        self.likeCount = likeCount
        self.shareCount = shareCount
        self.datePosted = datePosted
    }

    /// Convert current post object to a dictionary (JSON) format to be compatible to store on Firebase Database.
    /// Note: This used to be the `convertPostToJSON(with post:)` function in `PostsManager` but was moved here for consistency with `RECUser`.
    /// - Parameter dateFormatter: The date formatter used to convert the post's date into its pre-configured format
    /// - Returns: JSON format of the provided post
    public func toDictionary(using dateFormatter: DateFormatter) -> [String: Any] {
        let postData: [String: Any] = [
            self.id: [
                "poster_id": self.originalPoster.firebaseUID,
                "post_type": self.type.rawValue,
                "content": self.content as Any,
                "comments_count": self.commentCount,
                "likes_count": self.likeCount,
                "shares_count": self.shareCount,
                "date_posted": dateFormatter.string(from: self.datePosted)
            ]
        ]
        return postData
    }

    public static let placeholder = RECPost(id: "0000000000000000",
                                            poster: RECUser.placeholderUser,
                                            type: .text,
                                            content: nil,
                                            commentCount: 10,
                                            likeCount: 20,
                                            shareCount: 30,
                                            datePosted: Date())
}
