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
    
    @State private var hasRequested = false
    
    var body: some View {
        ScrollView {
            RECOtherUserHeader(userInfo: userInfo)
            
            HStack {
                if !hasRequested {
                    // FOLLOW BUTTON
                    Button(action: {
                        if userInfo.user.isProtectedAccount {
                            followingManager.requestToFollow(userInfo.user)
                        } else {
                            followingManager.follow(userInfo.user)
                        }
                    }) {
                        Label("Follow", systemImage: userInfo.user.isProtectedAccount ? CUPSystemIcon.userRequestAction : CUPSystemIcon.add)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                } else {
                    // UNFOLLOW BUTTON
                    Button(action: {}) {
                        Text("Unfollow")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                }
                
                Button(action: {}) {
                    Label("QR Code", systemImage: CUPSystemIcon.qrcode)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            }
            .padding(.horizontal)
            
            HStack {
                RECSubscriberIndicator(subscriberCount: userInfo.user.followers.count,
                                       subscriberType: .follower)
                
                RECSubscriberIndicator(subscriberCount: userInfo.user.followings.count,
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
            hasRequested = followingManager.hasRequested(otherUser: userInfo.user)
        }
    }
}

struct OtherUserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
