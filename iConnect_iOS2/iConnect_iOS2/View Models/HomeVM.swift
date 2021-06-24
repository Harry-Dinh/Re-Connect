//
//  HomeVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-28.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct PostModel {
    var id = UUID()
    var body: String
    var datePosted: Date
    var title: String
}

class HomeVM: ObservableObject {
    static let shared = HomeVM()
    
    private var firestoreRef = Firestore.firestore()
    
    @Published var postModel: [PostModel] = []
    
    @Published var showViewSettings: Bool = false
    
    /// This function identify the current user's email and their ID to fetch posts and displaying them on the Home screen.
    public func getPosts() {
        guard let email = Auth.auth().currentUser?.email,
              let currentUserID = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        firestoreRef.collection("User \(safeEmail)_\(currentUserID)").getDocuments { snapshot, error in
            guard let snapshot = snapshot, error == nil else {
                print("Cannot fetch data")
                return
            }
            
            print("Successfully fetch data")
            // Fetch post data from Firestore.
            self.postModel = snapshot.documents.compactMap({ documentSnapshot -> PostModel? in
                let documentData = documentSnapshot.data()
                
                if let body = documentData["body"] as? String,
                   let datePosted = documentData["datePosted"] as? Date,
                   let title = documentData["title"] as? String {
                    return PostModel(body: body, datePosted: datePosted, title: title)
                }
                else {
                    return nil
                }
            })
        }
    }
}
