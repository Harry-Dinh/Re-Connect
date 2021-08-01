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
    var userModel = [UserModel]()
    
    var body: some View {
        VStack {
            if !viewModel.noResultsLabelHidden {
                Text("No Results")
                    .font(.title)
                    .foregroundColor(.secondary)
            }
            else {
                List {
                    ForEach(userModel, id: \.self) { user in
                        NavigationLink(destination: EmptyView()) {
                            DiscoverListRow(fullName: "\(user.firstName) \(user.lastName)")
                        }
                    }
                }
            }
        }
        .navigationTitle("Discover")
        .navigationBarTitleDisplayMode(.inline)
        .navigationSearchBar({
            SearchBar("Search for people, posts and more!", text: $viewModel.searchField, onCommit:  {
                viewModel.hasFetched = true
                
                viewModel.searchFieldReturnButtonTapped(viewModel.searchField)
            })
            .onCancel {
                viewModel.hasFetched = false
            }
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "camera.viewfinder")
                })
            }
        }
    }
}

struct Discover_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Discover()
        }
    }
}
