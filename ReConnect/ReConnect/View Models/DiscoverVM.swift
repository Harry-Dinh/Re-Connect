//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import Firebase

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private var databaseRef = Database.database().reference()
    private var firestoreRef = Firestore.firestore()
    
    var users = [UserModel]()
    
    @Published var searchField: String = ""
    @Published var isTextFieldEditing: Bool = false
    @Published var noResultsLabelHidden: Bool = false
    
    public func fetchUsers() {
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
                let isPrivateAccount = data["isPrivateAccount"] as? Bool ?? false
                let uid = data["uid"] as? String ?? ""
                
                return UserModel(fullName: fullName, username: username, isPrivateAccount: isPrivateAccount, uid: uid)
            }
        }
    }
}

/// A table view cell for the Discover tab
struct DiscoverListRow: View {
    
    var fullName: String
    var username: String
    var isPrivateAccount: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 50))
            
            VStack(alignment: .leading) {
                Text(fullName)
                    .font(.headline)
                Text(username)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if isPrivateAccount {
                Image(systemName: "lock.fill")
                    .imageScale(.large)
                    .frame(width: 30)
                    .foregroundColor(.secondary)
            }
            else {
                Image(systemName: "lock.open.fill")
                    .imageScale(.large)
                    .frame(width: 30)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct DiscoverListRowPreview: PreviewProvider {
    static var previews: some View {
        DiscoverListRow(fullName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: false)
    }
}
