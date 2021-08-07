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
    
    var body: some View {
        VStack {
            if viewModel.searchField.isEmpty {
                Text("Search for something!")
            }
            else {
                List {
                    ForEach(viewModel.users, id: \.self) { user in
                        DiscoverListRow(fullName: user.fullName, username: user.username)
                    }
                }
            }
        }
        .navigationTitle("Discover")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "camera.viewfinder")
                })
            }
        }
        .navigationSearchBar {
            SearchBar("Search...", text: $viewModel.searchField, onCommit:  {
                viewModel.fetchUsers()
            })
        }
        .navigationSearchBarHiddenWhenScrolling(false)
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Discover()
        }
    }
}
