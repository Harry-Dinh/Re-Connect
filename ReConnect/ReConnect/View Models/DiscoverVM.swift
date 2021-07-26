//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import Firebase

struct UserModel: Identifiable {
    var id: String
    var fullName: String
    var username: String
    var profilePicURL: String
}

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    private var databaseRef = Database.database().reference()
    
    @Published var searchField: String = ""
    @Published var isTextFieldEditing: Bool = false
}

/// A table view cell for the Discover tab
struct DiscoverListRow: View {
    
    var fullName: String
    var username: String
    var profilePic: UIImage
    
    var body: some View {
        HStack {
            Image(uiImage: profilePic)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(15)
            
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
