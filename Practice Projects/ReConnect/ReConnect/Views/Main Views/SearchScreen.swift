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
                
            }
            .navigationTitle("Search")
            .searchable(text: $viewModel.searchQuery,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: Text("Search for posts, people and more..."))
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
