//
//  Discover.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI
import SwiftUIX

struct Discover: View {
    
    @ObservedObject var viewModel = DiscoverVM.shared
    let users = [UserModel]()
    
    var body: some View {
        VStack {
            List {
                ForEach(users, id: \.self) { user in
                    if !user.middleName.isEmpty {
                        DiscoverListRow(fullName: "\(user.firstName) \(user.middleName) \(user.lastName)", username: user.username)
                    }
                    else {
                        DiscoverListRow(fullName: "\(user.firstName) \(user.lastName)", username: user.username)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "camera.viewfinder")
                }
            }
        }
        .navigationSearchBar({
            SearchBar("Search for people, posts and more!", text: $viewModel.searchField, isEditing: $viewModel.isTextFieldEditing, onCommit: {
                viewModel.fetchUsers()
            })
        })
        .navigationTitle("Discover")
        .navigationSearchBarHiddenWhenScrolling(false)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Discover()
        }
    }
}
