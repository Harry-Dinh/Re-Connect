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
            Button("Reset Current User's Following and Follower Counts") {
                guard var currentUser = loginVM.currentUser else {
                    return
                }
                currentUser.followingsUIDs.removeAll()
                currentUser.followersUIDs.removeAll()
                currentUser.followingCount = currentUser.followingsUIDs.count
                currentUser.followerCount = currentUser.followersUIDs.count
                loginVM.currentUser = currentUser
                registerVM.writeUpdatedUserInfo(with: currentUser)
                loginVM.cacheLoggedInUser()
                loginVM.readLoggedInUser()
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
