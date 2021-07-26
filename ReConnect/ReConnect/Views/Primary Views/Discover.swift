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
    
    var searchField: some View {
        CustomSearchField(text: $viewModel.searchField, placeholder: "Search for people, posts and more!")
            .padding()
    }
    
    var body: some View {
        VStack {
            List {
                
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
                // Execute the search function
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
