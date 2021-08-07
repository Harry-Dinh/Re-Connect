//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import SwiftUIX
import Firebase

struct UserModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var fullName: String
    var username: String
}

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private var databaseRef = Database.database().reference()
    private var firestoreRef = Firestore.firestore()
    
    var users = [UserModel]()
    
    @Published var searchField: String = ""
    @Published var isTextFieldEditing: Bool = false
    @Published var noResultsLabelHidden: Bool = false
    
    public func fetchUsers() {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let path = firestoreRef.collection("users")
        path.addSnapshotListener { snapshot, error in
            guard let doc = snapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = doc.map { snapshot -> UserModel in
                let data = snapshot.data()
                
                let fullName = data["fullName"] as? String ?? "Unnamed User"
                let username = data["username"] as? String ?? "No username"
                
                return UserModel(fullName: fullName, username: username)
            }
        }
    }
}

/// A table view cell for the Discover tab
struct DiscoverListRow: View {
    
    var fullName: String
    var username: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fullName)
                    .font(.headline)
                Text(username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
