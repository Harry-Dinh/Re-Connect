//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import Firebase

struct UserModel: Hashable {
    var firstName: String
    var middleName: String
    var lastName: String
    var username: String
}

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private var databaseRef = Database.database().reference()
    
    @Published var searchField: String = ""
    @Published var isTextFieldEditing: Bool = false
    
    var usersToFilter = [UserModel]()
    var filteredUserResults = [UserModel]()
    
    public func fetchUsers() {
        databaseRef.child("Users").queryOrdered(byChild: "lastName").queryStarting(atValue: "\u{f8ff}").queryLimited(toFirst: 20).observeSingleEvent(of: .childAdded) { [weak self] snapshot in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let firstName = dictionary["firstName"] as! String
                let middleName = dictionary["middleName"] as! String
                let lastName = dictionary["lastName"] as! String
                let username = dictionary["username"] as! String
                
                let user = UserModel(firstName: firstName, middleName: middleName, lastName: lastName, username: username)
                self?.usersToFilter.append(user)
            }
        }
        
        UITableView().reloadData()
    }
}

/// A table view cell for the Discover tab
struct DiscoverListRow: View {
    
    var fullName: String
    var username: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(fullName)
                    .font(.headline)
                
                Text(username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
