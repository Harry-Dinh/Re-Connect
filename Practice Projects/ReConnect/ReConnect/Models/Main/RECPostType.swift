//
//  RECPostType.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-09-04.
//

import Foundation

/// A group of enums representing the possible types of posts that users can post on Re:Connect
enum RECPostType: String {
    /// An enum representing a standard text-based post
    case text = "text"
    /// An enum representing a media-based (i.e. photos, videos) post
    case media = "media"
    /// An enum representing other kinds of post (usually use for default cases or corrupted posts)
    case other = "other"
    
    // Note that this is not the exhaustive list of post types. Add more post types in the future as needed...
}
