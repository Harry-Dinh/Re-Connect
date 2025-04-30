//
//  PostsManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-30.
//

import FirebaseDatabase
import SwiftUI

class PostsManager: ObservableObject {
    public static let instance = PostsManager()

    private let currentUserRef = LoginScreenVM.viewModel.currentUser
    private let databaseRef = Database.database().reference()
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    /// Write the data of the provided post to Firebase Database.
    /// - Parameter post: The post whose data will be used to write to the database
    public func post(_ post: RECPost) {
        // Convert post to JSON data
        let postData = convertPostToJSON(with: post)

        // Write data to the "RECPosts" node on the database. This is the primary node where all posts (and their data) reside
        databaseRef.child(RECDatabaseParentPath.usersPosts).updateChildValues(postData) { error, ref in
            guard error != nil else {
                print("An error occured when trying to write post data to database")
                return
            }
            print("Successfully write post data to database.")

            // Update the current user's feed with this new post as well (because... makes sense, you should be able to see your own post)

            // TODO: Write post ID to every user's follower's feed for efficient querying
        }
    }

    /// Convert the provided post object to a JSON format to be compatible to store on Firebase Database.
    /// - Parameter post: The post whose data will be used to convert to JSON
    /// - Returns: JSON format of the provided post
    private func convertPostToJSON(with post: RECPost) -> [String: Any] {
        let postData: [String: Any] = [
            post.id: [
                "poster_id": post.originalPoster.firebaseUID,
                "post_type": post.type.rawValue,
                "content": post.content as Any,
                "comments_count": post.commentCount,
                "likes_count": post.likeCount,
                "shares_count": post.shareCount,
                "date_posted": dateFormatter.string(from: post.datePosted)
            ]
        ]
        return postData
    }

    /// Write the newly written post ID to every of the user's follower's feed for efficient querying
    /// - Parameters:
    ///   - postID: The post ID to be written to
    ///   - user: The user (aka. original poster) to get the followers IDs from
    private func writePostIDToFollowers(with postID: String, of user: RECUser) {
        // TODO: Modify the RECUser object to include an array if post IDs before continue implenting this function!
    }
}
