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
                        Menu {
                            Button(action: {}) {
                                Label("Present QR Code", systemImage: CUPSystemIcon.qrcode)
                            }
                            
                            Button(action: {}) {
                                Label("Scan QR Code", systemImage: CUPSystemIcon.scanQRCodeAction)
                            }
                        } label: {
                            RECNavButtonLabel(iconName: CUPSystemIcon.qrcode)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            RECNavButtonLabel(iconName: CUPSystemIcon.add)
                        }
                        
                        Menu {
                            Button(action: {
                                editProfileVM.tempUser = loginVM.currentUser ?? RECUser.placeholderUser
                                viewModel.showEditProfileScreen.toggle()
                            }) {
                                Label("Edit Profile", systemImage: CUPSystemIcon.profile)
                            }
                            
                            Button(action: {}) {
                                Label("Customize QR Code", systemImage: CUPSystemIcon.qrcode)
                            }
                        } label: {
                            RECNavButtonLabel(iconName: CUPSystemIcon.edit)
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
