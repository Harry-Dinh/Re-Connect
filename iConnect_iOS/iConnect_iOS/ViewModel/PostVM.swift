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
        
        firestore.collection("User \(safeEmail)_\(currentUserID)").addSnapshotListener { [weak self] (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }

            self?.postModel = documents.compactMap({ (snapshot) -> PostModel in
                let data = snapshot.data()

                var title = ""
                var body = ""
                var date = ""
                var liked = false

                title = data["title"] as? String ?? ""
                body = data["body"] as? String ?? ""
                date = data["date"] as? String ?? ""
                liked = data["liked"] as? Bool ?? false
                
                self?.postTitle = title
                self?.postBody = body
                self?.datePosted = date
                self?.liked = liked

                return PostModel(id: .init(), title: title, body: body, date: date, liked: liked)
            })
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
