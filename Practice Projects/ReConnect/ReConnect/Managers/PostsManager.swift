//
//  PostsManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-30.
//

import FirebaseDatabase
import SwiftUI

/// A class that manages all things related to Re:Connect social media posts.
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
    /// - Parameters:
    ///    - post: The post whose data will be used to write to the database
    ///    - completionHandler: Calls additional functions on completion
    public func post(_ post: RECPost, completionHandler: @escaping () -> Void) {
        // Convert post to JSON data
        let postData = post.toDictionary(using: dateFormatter)

        // Write data to the "RECPosts" node on the database. This is the primary node where all posts (and their data) reside
        databaseRef.child(RECDatabaseParentPath.usersPosts).updateChildValues(postData) { [weak self] error, ref in
            guard error == nil else {
                print("An error occured when trying to write post data to database")
                return
            }
            print("Successfully write post data to database.")

            // Update the current user's feed with this new post as well (because... makes sense, you should be able to see your own post)
            let newPostID: [String: Any] = [
                post.id: post.id
            ]
            self?.databaseRef.child(RECDatabaseParentPath.users).child(post.originalPoster.firebaseUID).child(RECUser.Property.homeFeedIDs).updateChildValues(newPostID) { err, ref in
                guard err == nil else {
                    print("Unable to write post to original poster's home feed")
                    return
                }
                print("Successfully written to original poster's feed")

                // If succeeded, proceed to do the same thing with all followers
                self?.writePostIDToFollowers(with: post.id, of: post.originalPoster)
                completionHandler()
            }
        }
    }

    /// Write the newly written post ID to every of the user's follower's feed for efficient querying
    /// - Parameters:
    ///   - postID: The post ID to be written to
    ///   - user: The user (aka. original poster) to get the followers IDs from
    private func writePostIDToFollowers(with postID: String, of user: RECUser) {
        // Exit early if the user's followers list is empty
        if user.followers.isEmpty {
            print("Unable to write post ID because there are no followers")
            return
        }

        let newPostData: [String: Any] = [
            postID: postID
        ]

        // Otherwise, continue with the implementation
        for follower in user.followers {
            databaseRef.child(RECDatabaseParentPath.users).child(follower).child(RECUser.Property.homeFeedIDs).updateChildValues(newPostData) { err, ref in
                guard err == nil else {
                    print("Unable to write post id to user \(follower)")
                    return
                }
                print("Successfully written post id to user \(follower)")
            }
        }
    }
}
