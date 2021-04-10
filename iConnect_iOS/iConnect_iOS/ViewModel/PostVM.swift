//
//  PostVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-29.
//

import SwiftUI
import Firebase

class PostVM: ObservableObject {
    static let shared = PostVM()
    
    @Published var postModel = [PostModel]()
    @Published var username = ""
    
    @Published var postTitle = ""
    @Published var postBody = ""
    @Published var datePosted = ""
    @Published var liked = false
    
    private var firestore = Firestore.firestore()
    private var database = Database.database().reference()
    
    private init() {}
    
    public func fetchPostDataFromFirestore() {
        
        fetchUserName()
        
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = DatabaseManager.shared.convertToSafeEmail(with: email)
        
        firestore.collection("User \(safeEmail)_\(currentUserID)").addSnapshotListener { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            
            let title = documents.map { $0["title"]! }
            let body = documents.map { $0["body"]! }
            let date = documents.map { $0["date"]! }
            let liked = documents.map { $0["liked"]! }
            
            for i in 0..<title.count {
                self.postModel.append(PostModel(title: title[i] as? String ?? "Untitled Post",
                                                body: body[i] as? String ?? "This post has no body text",
                                                date: date[i] as? String ?? "Unknown date",
                                                liked: liked[i] as? Bool ?? false))
            }
        }
    }
    
    public func fetchUserName() {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = DatabaseManager.shared.convertToSafeEmail(with: email)
        
        database.child("Users").child("user \(safeEmail)_\(currentUserID)").observeSingleEvent(of: .value) { [weak self] (snapshot) in
            if let value = snapshot.value as? [String: AnyObject] {
                let firstName = value["first_name"] as? String
                let lastName = value["last_name"] as? String
                
                self?.username = "\(firstName ?? "Unknown") \(lastName ?? "User")"
            }
        }
    }
}
