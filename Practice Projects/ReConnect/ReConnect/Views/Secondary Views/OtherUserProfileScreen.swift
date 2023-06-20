//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct OtherUserProfileScreen: View {
    
    var userInfo: RECUser
    
    var body: some View {
        NavigationStack {
            ScrollView {
                RECProfileHeader(userInfo: userInfo)
                
                HStack {
                    RECSubscriberIndicator(subscriberCount: userInfo.followerCount,
                                           subscriberType: .follower)
                    
                    RECSubscriberIndicator(subscriberCount: userInfo.followingCount,
                                           subscriberType: .following)
                }
                .padding(.horizontal)
                
//                RECProfileInfoSheet()
//                    .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        if userInfo.isProtectedAccount {
                            Button(action: {}) {
                                Label("Request to Follow", systemImage: CUPSystemIcon.userRequestAction)
                            }
                        } else {
                            Button(action: {}) {
                                Label("Follow User", systemImage: CUPSystemIcon.person)
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
}

struct OtherUserProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        OtherUserProfileScreen(userInfo: RECUser.placeholderUser)
    }
}
