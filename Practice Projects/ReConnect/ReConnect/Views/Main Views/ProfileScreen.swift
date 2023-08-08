//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var viewModel = ProfileScreenVM.viewModel
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.viewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                if appearanceSettingsVM.useThemeBackground {
                    RECThemeBackground()
                }
                
                ScrollView {
                    RECProfileHeader(userInfo: RECUserWrapper(loginVM.currentUser ?? RECUser.placeholderUser))
                    
                    HStack {
                        RECSubscriberIndicator(subscriberCount: loginVM.currentUser?.followers.count ?? RECUser.placeholderUser.followers.count,
                                               subscriberType: .follower)
                        .onTapGesture {
                            viewModel.showFollowerScreen.toggle()
                        }
                        
                        RECSubscriberIndicator(subscriberCount: loginVM.currentUser?.followings.count ?? RECUser.placeholderUser.followings.count,
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
                        RECNavButton(iconName: CUPSystemIcon.qrcode, action: {})
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        RECNavButton(iconName: CUPSystemIcon.add, action: {})
                        
                        RECNavButton(iconName: CUPSystemIcon.edit) {
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
