//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject private var viewModel = ProfileScreenVM.instance
    @ObservedObject private var editProfileVM = EditProfileScreenVM.instance
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.instance
    @StateObject private var feedScreenVM = FeedScreenVM.instance

    @State private var usersPost: [RECPost] = []
    @State private var isPostDividerScrolledOutOfView = false

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    profileHeader
                    secondaryInfoSection
                    userPostsSection
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        scanQRButton
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        newPostButton
                        editProfileButton
                    }
                }
                .fullScreenCover(isPresented: $viewModel.showEditProfileScreen, content: EditProfileScreen.init)
                .sheet(isPresented: $viewModel.showFollowerScreen) {
                    FollowerScreen(userInfo: RECUserWrapper(loginVM.currentUser ?? RECUser.placeholderUser))
                }
                .sheet(isPresented: $viewModel.showFollowingScreen) {
                    FollowingScreen(userInfo: RECUserWrapper(loginVM.currentUser ?? RECUser.placeholderUser))
                }
                .sheet(isPresented: $viewModel.showPostCreationScreen, content: PostCreationView.init)
                #if os(iOS)
                .safeAreaInset(edge: .bottom) {
                    if RECConstants.isUIiPhone && isPostDividerScrolledOutOfView {
                        ProfileToolbar()
                            .padding(.horizontal)
                            .transition(.move(edge: .bottom))
                    }
                }
                .animation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5), value: isPostDividerScrolledOutOfView)
                #endif
                .refreshable {
                    loginVM.fetchUserDataFromDatabase(with: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    loginVM.readLoggedInUser()
                }
                .onAppear {
                    #warning("TODO: Find a better, more efficient solution for updating this!")
                    guard let currentUser = loginVM.currentUser else {
                        return
                    }

                    let currentUserPosts = feedScreenVM.currentUserFeed.filter {
                        $0.originalPoster.firebaseUID == currentUser.firebaseUID
                    }
                    usersPost = currentUserPosts
                }
            }
        }
    }

    // MARK: - Subviews

    private var profileHeader: some View {
        RECProfileHeader(userInfo: RECUserWrapper(loginVM.currentUser ?? RECUser.placeholderUser))
    }

    private var subscriberIndicators: some View {
        HStack {
            RECSubscriberIndicator(subscriberCount: loginVM.currentUser?.followerCount ?? -1,
                                   subscriberType: .follower)
            .onTapGesture {
                viewModel.showFollowerScreen.toggle()
            }

            RECSubscriberIndicator(subscriberCount: loginVM.currentUser?.followingCount ?? -1,
                                   subscriberType: .following)
            .onTapGesture {
                viewModel.showFollowingScreen.toggle()
            }
        }
    }

    private var secondaryInfoSection: some View {
        Group {
            subscriberIndicators
            RECProfileInfoSheet()
        }
        .padding(.horizontal)
    }

    private var userPostsSection: some View {
        Group {
            Divider()
                .onScrolledOutOfView($isPostDividerScrolledOutOfView)
            ForEach(0..<60, id: \.self) { num in
                Text("\(num)")
            }
        }
    }

    private var scanQRButton: some View {
        Button("Scan QR Code", systemImage: CUPSystemIcon.qrcode) {}
    }

    private var newPostButton: some View {
        Button("New Post", systemImage: CUPSystemIcon.add) {
            viewModel.showPostCreationScreen.toggle()
        }
    }

    private var editProfileButton: some View {
        Button("Edit Profile", systemImage: CUPSystemIcon.edit) {
            editProfileVM.tempUser = loginVM.currentUser ?? RECUser.placeholderUser
            viewModel.showEditProfileScreen.toggle()
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
