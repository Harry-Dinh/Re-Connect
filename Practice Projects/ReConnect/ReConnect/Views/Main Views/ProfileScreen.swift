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
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    RECProfileHeader(userInfo: RECUserWrapper(loginVM.currentUser ?? RECUser.placeholderUser))
                    
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
                    .padding(.horizontal)
                    
                    RECProfileInfoSheet()
                        .padding(.horizontal)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Scan QR Code", systemImage: CUPSystemIcon.qrcode) {}
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("New Post", systemImage: CUPSystemIcon.add) {
                            viewModel.showPostCreationScreen.toggle()
                        }
                        
                        Button("Edit Profile", systemImage: CUPSystemIcon.edit) {
                            editProfileVM.tempUser = loginVM.currentUser ?? RECUser.placeholderUser
                            viewModel.showEditProfileScreen.toggle()
                        }
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
                .refreshable {
                    loginVM.fetchUserDataFromDatabase(with: loginVM.currentUser?.getFirebaseUID() ?? RECUser.placeholderUser.getFirebaseUID())
                    loginVM.readLoggedInUser()
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
