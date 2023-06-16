//
//  SearchScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-12.
//

import SwiftUI

struct SearchScreen: View {
    
    @ObservedObject private var viewModel = SearchScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                if !viewModel.searchQuery.isEmpty {
                    Section {
                        ForEach(viewModel.usersSearchResult, id: \.firebaseUID) { user in
                            NavigationLink(destination: SearchResultUserScreen(user: user)) {
                                RECSearchResultUserRow(user: user)
                            }
                        }
                    } header: {
                        Text("Users")
                    }
                }
            }
            .navigationTitle("Search")
            .headerProminence(.increased)
            .searchable(text: $viewModel.searchQuery,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("Search for posts, users and more..."))
            .onSubmit(of: .search) {
                viewModel.fetchUsers(with: viewModel.searchQuery)
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
