//
//  DeveloperSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct DeveloperSettingsScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject private var registerVM = RegisterScreenVM.instance
    @ObservedObject private var postsManager = PostsManager.instance

    var body: some View {
        List {
            Section(header: Text("Post Fetching Tests")) {
                Button("Test fetching posts IDs") {
                    postsManager.fetchFeedPostIDs(of: loginVM.currentUser ?? RECUser.placeholderUser) { postIDs in
                        if let postIDs = postIDs {
                            print(postIDs)
                        } else {
                            print("Nothing is fetched")
                        }
                        // In real production, you would call the fetchPosts() function down here...
                    }
                }
                Button("Test fetching posts") {}
            }
        }
        .navigationTitle("Developer")
    }
}

struct DeveloperSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSettingsScreen()
    }
}
