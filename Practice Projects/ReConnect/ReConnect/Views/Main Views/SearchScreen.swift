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
                        ForEach(viewModel.listOfUsers, id: \.firebaseUID) { user in
                            RECSearchResultUserRow(user: user)
                        }
                    } header: {
                        Text("Users")
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $viewModel.searchQuery,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("Search for posts, people and more..."))
            .headerProminence(.increased)
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
