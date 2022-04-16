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
                }
            }
            .navigationTitle("Followers")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") { presentationMode.wrappedValue.dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {} label: {
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
