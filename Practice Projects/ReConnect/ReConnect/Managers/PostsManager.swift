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

    private let feedScreenVM = FeedScreenVM.instance
    private let loginVM = LoginScreenVM.instance
    private let databaseRef = Database.database().reference()
    private let databaseManager = DatabaseManager.instance

    public let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()

    // MARK: - WRITE POSTS

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
        if user.followers.isEmpty {
            print("Unable to write post ID because there are no followers")
            return
        }

        let newPostData: [String: Any] = [
            postID: postID
        ]

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

    // MARK: - READING POSTS

    /// Fetch the first 10 posts for the current user. When this function is called again, fetch the next 10 posts **starting from the oldest (date wise) post from the previous fetch**.
    /// - Parameters:
    ///    - postIDs: An array of post IDs to fetch the real data from (under the `RECPosts` node)
    ///    - oldestIDFromLastFetch: A post ID that is the oldest (date wise) from the previous fetch. Pass in `nil` to fetch starting from the latest post in the current user's feed.
    public func fetchPosts(from postIDs: [String], oldestIDFromLastFetch: String?) {
        if postIDs.isEmpty {
            print("No posts to fetch")
            return
        }

        if oldestIDFromLastFetch != nil {
            // Fetch since last oldest post
            // TODO: Implement this later! For now, get the fetching functionality working first!
        } else {
            for id in postIDs {
                databaseRef.child(RECDatabaseParentPath.usersPosts).child(id).getData { [weak self] error, snapshot in
                    guard let snap = snapshot,
                          let value = snap.value as? [String: Any],
                          error == nil else {
                        print("Unable to fetch post data")
                        return
                    }

                    let commentCount = value["comments_count"] as? Int ?? -1
                    let content = value["content"]      // This will be cast later in the RECPostView
                    let dateStr = value["date_posted"] as? String ?? "No date data"
                    let likesCount = value["likes_count"] as? Int ?? -1
                    let postTypeStr = value["post_type"] as? String ?? RECPostType.other.rawValue
                    let posterID = value["poster_id"] as? String ?? RECUser.placeholderUser.firebaseUID
                    let sharesCount = value["shares_count"] as? Int ?? -1

                    // Fetch original poster data and convert the remaining data
                    self?.databaseManager.fetchData(with: posterID) { originalPoster in
                        guard let originalPoster = originalPoster else {
                            print("Unable to fetch original poster with id: \(posterID)")
                            return
                        }

                        let postType: RECPostType
                        switch postTypeStr {
                            case RECPostType.text.rawValue:
                                postType = .text
                            case RECPostType.media.rawValue:
                                postType = .media
                            default:
                                postType = .other
                        }

                        let datePosted = self?.dateFormatter.date(from: dateStr)
                        let fetchedPost = RECPost(
                            id: id,
                            poster: originalPoster,
                            type: postType,
                            content: content,
                            commentCount: commentCount,
                            likeCount: likesCount,
                            shareCount: sharesCount,
                            datePosted: datePosted ?? Date()
                        )
                        self?.feedScreenVM.currentUserFeed.append(fetchedPost)
                    }
                }
            }
        }
    }

    /// Fetch the post IDs from the user's home feed node. The `PostsManager.fetchPosts()` function should be called in the completion handler of this function.
    /// - Parameters:
    ///   - user: The user whose ID will be use to fetch post IDs from the home feed
    ///   - completion: A completion handler with an array of post IDs passed in to be used (usually used with `PostsManager.fetchPosts()` function)
    public func fetchFeedPostIDs(of user: RECUser, completion: @escaping ([String]?) -> Void) {
        guard let currentUser = loginVM.currentUser else {
            print("Unable to unwrap current user object")
            completion(nil)
            return
        }

        let currentUserID = currentUser.firebaseUID
        databaseRef.child(RECDatabaseParentPath.users).child(currentUserID).child(RECUser.Property.homeFeedIDs).getData { error, snapshot in
            guard let snap = snapshot, error == nil,
                  let value = snap.value as? [String: Any] else {
                print("Unable to access current user \(currentUserID) posts")
                completion(nil)
                return
            }
            let postIDs = Array(value.keys)
            completion(postIDs)
        }
    }
}

extension Date {
    /// Calls the `DateFormatter.string(from:)` function using the predefined formatter in `PostsManager` to convert the calling `Date` object to string (that is hopefully also localized.)
    /// - Returns: A string form of the calling `Date` object
    func localizedStringValue() -> String {
        let dateFormatter = PostsManager.instance.dateFormatter
        return dateFormatter.string(from: self)
    }
}
