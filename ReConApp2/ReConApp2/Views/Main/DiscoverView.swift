//
//  DiscoverView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-27.
//

import SwiftUI

struct DiscoverView: View {
    
    @ObservedObject var vm = DiscoverVM.shared
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Users")) {
                    ForEach(vm.users) { user in
                        NavigationLink(destination: ProfileDiscoverView(user: user)) {
                            DiscoverUserRowView(user: user)
                        }
                    }
                }
                .headerProminence(.increased)
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button(action: {}) {
                        Label("Follow", systemImage: "checkmark.circle")
                    }
                    .tint(.accentColor)
                }
            }
            .searchable(text: $vm.searchParam)
            .listStyle(.insetGrouped)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Discover")
                        .font(.title)
                        .bold()
                }
            }
            .refreshable {
                vm.getAllUsers()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
