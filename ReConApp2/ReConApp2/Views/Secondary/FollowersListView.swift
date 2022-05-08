//
//  FollowersListView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-04-15.
//

import SwiftUI

struct FollowersListView: View {
    
    var followersList: [ReConUser]
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                if followersList.isEmpty {
                    VStack(spacing: 5) {
                        Text(Image(systemName: "person.2.fill"))
                        Text("No one followed you... yet.")
                    }
                    .font(.title2)
                    .foregroundColor(.secondary)
                }
                else {
                    List {
                        ForEach(followersList) { follower in
                            DiscoverUserRowView(user: follower)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable {
                        ProfileVM.shared.fetchFollowers()
                    }
                }
            }
            .navigationTitle("Followers")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        EditButton()

                        Section {
                            Button {
                                ProfileVM.shared.fetchFollowers()
                            } label: {
                                Label("Refresh", systemImage: "arrow.clockwise")
                            }

                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

struct FollowersListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowersListView(followersList: [])
    }
}
