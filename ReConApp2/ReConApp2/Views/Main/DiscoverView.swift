//
//  DiscoverView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-27.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var vm = DiscoverVM.shared
    private var usersSearchResults: [ReConUser] {
        if vm.searchParam.isEmpty {
            return vm.users
        }
        else {
            return vm.users.filter { $0.fullName.localizedCaseInsensitiveContains(vm.searchParam) }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Users")) {
                    ForEach(usersSearchResults) { user in
                        NavigationLink(destination: ProfileDiscoverView(user: user)) {
                            DiscoverUserRowView(user: user)
                        }
                    }
                }
                .headerProminence(.increased)
                // SWIPE TO FOLLOW HAS TO BE IMPLEMENTED LATER
//                .swipeActions(edge: .leading, allowsFullSwipe: true) {
//                    Button(action: {}) {
//                        Label("Follow", systemImage: "checkmark.circle")
//                    }
//                    .tint(.accentColor)
//                }
            }
            .searchable(text: $vm.searchParam, prompt: "Search for users, posts and more...")
            .listStyle(.insetGrouped)
            .navigationBarTitleDisplayMode(.inline)
            .refreshable {
                vm.getAllUsers()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Discover")
                        .bold()
                        .font(.title)
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
