//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct OtherUserProfileScreen: View {
    
    @ObservedObject var userInfo: RECUserWrapper
    @ObservedObject private var followingManager = FollowingManager.shared
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var followVM = FollowScreenVM.viewModel
    @ObservedObject private var vm = OtherUserProfileScreenVM.vm
    
    var body: some View {
        ScrollView {
            RECOtherUserHeader(userInfo: userInfo)
            
            HStack {
                if !vm.alreadyFollowed {
                    // FOLLOW BUTTON
                    Button(action: {
                        if userInfo.user.isProtectedAccount {
                            followingManager.requestToFollow(userInfo.user)
                        } else {
                            // Follow the user and fetch the information (to update the UI) all at once
                            followingManager.follow(userInfo.user)
                            vm.alreadyFollowed = followingManager.alreadyFollowed(userInfo.user)
                            followVM.fetchFollowers()
                            followVM.fetchFollowings()
                        }
                    }) {
                        Label("Follow", systemImage: userInfo.user.isProtectedAccount ? CUPSystemIcon.userRequestAction : CUPSystemIcon.add)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    // UNFOLLOW BUTTON
                    Button(action: {
                        // Present a confirmation to the user before unfollowing
                        vm.presentUnfollowActionSheet.toggle()
                    }) {
                        Text("Unfollow")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .confirmationDialog("Unfollow \(userInfo.user.displayName)?", isPresented: $vm.presentUnfollowActionSheet, titleVisibility: .visible) {
                        Button("Unfollow") {
                            // This operation works properly behind the scene, but doesn't update the UI accordingly... yet
                            vm.alreadyFollowed = followingManager.unfollow(userInfo.user)
                        }
                        Button("Cancel", role: .cancel) {}
                    }
                }
                
                Button(action: {}) {
                    Label("QR Code", systemImage: CUPSystemIcon.qrcode)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            
            HStack {
                RECSubscriberIndicator(subscriberCount: userInfo.user.followerCount,
                                       subscriberType: .follower)
                
                RECSubscriberIndicator(subscriberCount: userInfo.user.followingCount,
                                       subscriberType: .following)
            }
            .padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                
                Menu {
                    Button(action: {
                        if userInfo.user.isProtectedAccount {
                            followingManager.requestToFollow(userInfo.user)
                        } else {
                            followingManager.follow(userInfo.user)
                        }
                    }) {
                        if userInfo.user.isProtectedAccount {
                            Label("Request to Follow", systemImage: CUPSystemIcon.userRequestAction)
                        } else {
                            Label("Follow User", systemImage: CUPSystemIcon.add)
                        }
                    }
                    Button(action: {}) {
                        Label("Scan QR Code", systemImage: CUPSystemIcon.scanQRCodeAction)
                    }
                    
                    Section {
                        Button(role: .destructive, action: {}) {
                            Label("Block User", systemImage: CUPSystemIcon.blockAction)
                        }
                        
                        Button(role: .destructive, action: {}) {
                            Label("Report User", systemImage: CUPSystemIcon.reportAction)
                        }
                    }
                } label: {
                    Image(systemName: CUPSystemIcon.moreMenu)
                        .symbolVariant(.circle)
                }
            }
        }
        .onAppear {
            vm.alreadyFollowed = followingManager.alreadyFollowed(userInfo.user)
        }
    }
}

struct OtherUserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
