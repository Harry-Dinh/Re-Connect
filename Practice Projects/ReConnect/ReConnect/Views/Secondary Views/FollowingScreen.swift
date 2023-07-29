//
//  FollowingScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-16.
//

import SwiftUI

struct FollowingScreen: View {
    
    @ObservedObject var userInfo: RECUserWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userInfo.user.followings, id: \.firebaseUID) { user in
                    VStack(alignment: .leading, spacing: 5) {
                        Text(user.displayName)
                            .font(.headline)
                        Text(user.username)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("People You Followed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.filter)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss.callAsFunction()
                    }
                }
            }
            .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search"))
        }
    }
}

struct FollowingScreen_Previews: PreviewProvider {
    static var previews: some View {
        FollowingScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
