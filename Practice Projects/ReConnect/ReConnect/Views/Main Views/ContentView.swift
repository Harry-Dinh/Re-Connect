//
//  ContentView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject private var editProfileVM = EditProfileScreenVM.instance
    @ObservedObject private var notificationManager = NotificationManager.instance
    @ObservedObject private var postsManager = PostsManager.instance
    @ObservedObject private var appSettingsManager = AppSettingsManager.instance

    var body: some View {
        if loginVM.isSignedIn {
            CoreScreen()
                .onAppear {
                    // Initial read
                    loginVM.readLoggedInUser()
                    
                    // Read to update profile
                    loginVM.fetchUserDataFromDatabase(with: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())

                    // Fetch profile customization
                    editProfileVM.fetchProfileCustomizationData(from: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())

                    // Fetch user's post (currently testing)
                    postsManager.fetchFeedPostIDs(of: loginVM.currentUser ?? RECUser.placeholderUser) { postsID in
                        if let postIDs = postsID {
                            print("Successfully fetched posts IDs")
                            postsManager.fetchPosts(from: postIDs, oldestIDFromLastFetch: nil)
                        } else {
                            print("Unable to fetch posts IDs")
                        }
                    }

                    // Fetch notifications
                    notificationManager.fetchNotifications(for: loginVM.currentUser ?? RECUser.placeholderUser)

                    // Load all users settings
                    appSettingsManager.loadAllUserSettings()
                }
        } else {
            LoginScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
