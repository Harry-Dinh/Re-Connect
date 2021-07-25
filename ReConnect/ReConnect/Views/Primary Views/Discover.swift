//
//  Discover.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI

struct Discover: View {
    
    @ObservedObject var viewModel = DiscoverVM.shared
    
    var searchField: some View {
        CustomSearchField(text: $viewModel.searchField, placeholder: "Search for people, posts and more!")
            .padding()
    }
    
    var body: some View {
        VStack {
            searchField
            ScrollView {
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("Discover")
                    .font(.title)
                    .bold()
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}, label: {
                    Image(systemName: "camera.viewfinder")
                })
            }
        }
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
