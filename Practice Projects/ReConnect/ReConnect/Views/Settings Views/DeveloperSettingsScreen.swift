//
//  DeveloperSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct DeveloperSettingsScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var registerVM = RegisterScreenVM.viewModel
    
    var body: some View {
        List {
            Section("Following & Follower Test") {
                Button("Reset Current User's Following and Follower Counts") {
                    guard var currentUser = loginVM.currentUser else {
                        return
                    }
                    currentUser.followings.removeAll()
                    currentUser.followers.removeAll()
                    currentUser.followingCount = currentUser.followings.count
                    currentUser.followerCount = currentUser.followers.count
                    loginVM.currentUser = currentUser
                    registerVM.writeUpdatedUserInfo(with: currentUser)
                    loginVM.cacheLoggedInUser()
                    loginVM.readLoggedInUser()
                }
            }
            
            Section("Followers List") {
                if !loginVM.currentUser!.followers.isEmpty {
                    ForEach(loginVM.currentUser!.followers, id: \.firebaseUID) { user in
                        Text(user.firebaseUID)
                    }
                } else {
                    Text("No followers")
                        .foregroundColor(.secondary)
                }
            }
            
            Section("Following List") {
                if !loginVM.currentUser!.followings.isEmpty {
                    ForEach(loginVM.currentUser!.followings, id: \.firebaseUID) { user in
                        Text(user.firebaseUID)
                    }
                } else {
                    Text("No followings")
                        .foregroundColor(.secondary)
                }
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
