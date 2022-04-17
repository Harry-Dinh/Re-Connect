//
//  FollowersListView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-04-15.
//

import SwiftUI

struct FollowingsListView: View {
    
    var user: ReConUser
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ZStack {
                if user.followings.isEmpty {
                    VStack(spacing: 5) {
                        Text(Image(systemName: "checkmark.circle.fill"))
                        Text("You have not follow anybody")
                    }
                    .font(.title2)
                    .foregroundColor(.secondary)
                }
                else {
                    List {
                        ForEach(user.followings) { following in
                            DiscoverUserRowView(user: following)
                        }
                    }
                    .listStyle(.insetGrouped)
                    .refreshable {
                        ProfileVM.shared.fetchFollowings()
                    }
                }
            }
            .navigationTitle("Following")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") { presentationMode.wrappedValue.dismiss() }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        EditButton()
                        
                        Section {
                            Button {
                                ProfileVM.shared.fetchFollowings()
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

struct FollowingList_Previews: PreviewProvider {
    static var previews: some View {
        FollowingsListView(user: ReConUser())
    }
}
