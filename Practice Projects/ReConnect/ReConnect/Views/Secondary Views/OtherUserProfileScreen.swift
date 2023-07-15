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
    
    var body: some View {
        ScrollView {
            RECOtherUserHeader(userInfo: userInfo)
            
            HStack {
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
    }
}

struct OtherUserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
