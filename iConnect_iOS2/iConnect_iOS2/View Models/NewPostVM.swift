//
//  NewPostVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-03.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

class NewPostVM: ObservableObject {
    static let shared = NewPostVM()
    
    private var firestoreRef = Firestore.firestore()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    @Published var storyOrPost: Bool = false
    @Published var showNewPost: Bool = false
    @Published var postTitleField: String = ""
    @Published var postBodyField: String = ""
    @Published var addMedia: Bool = false
    @Published var isEditing: Bool = false
    
    @Published var containerHeight: CGFloat = 0
    
    public func writeTextPostToDatabase(title: String, body: String, datePosted: Date) {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = Methods.shared.convertToSafeEmail(email: email)
        
        let documentData: [String: Any] = [
            "title": title,
            "body": body,
            "datePosted": datePosted,
            "uuid": UUID().uuidString
        ]
        
        firestoreRef.collection("User \(safeEmail)_\(uid)").addDocument(data: documentData) { error in
            guard error == nil else {
                print("Failed to write data to Firestore")
                return
            }
            
            print("Successfully write data to Firestore")
        }
    }
}
