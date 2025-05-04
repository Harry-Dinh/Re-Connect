//
//  SearchScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-12.
//

import SwiftUI

struct SearchScreen: View {
    
    @ObservedObject private var viewModel = SearchScreenVM.instance
    
    var body: some View {
        NavigationStack {
            List {
                if !viewModel.searchQuery.isEmpty {
                    Section {
                        ForEach(viewModel.usersSearchResult, id: \.firebaseUID) { user in
                            NavigationLink(destination: OtherUserProfileScreen(userInfo: RECUserWrapper(user))) {
                                RECSearchResultUserRow(user: RECUserWrapper(user))
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
            .onChange(of: viewModel.searchQuery, perform: { _ in
                if !viewModel.searchQuery.isEmpty {
                    viewModel.fetchUsers2(with: viewModel.searchQuery)
                }
            })
            .onSubmit(of: .search) {
                if !viewModel.searchQuery.isEmpty {
                    viewModel.fetchUsers2(with: viewModel.searchQuery)
                }
            }
            .submitLabel(.search)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
