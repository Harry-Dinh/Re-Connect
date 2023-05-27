//
//  ProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    RECProfileHeader()
                        .padding(.leading, 25)
                    Spacer()
                }
                
                HStack {
                    RECSubscriberIndicator(subscriberCount: loginVM.loggedInUser?.followerCount ?? RECUser.placeholderUser.followerCount,
                                           subscriberType: .follower)
                    
                    RECSubscriberIndicator(subscriberCount: loginVM.loggedInUser?.followingCount ?? RECUser.placeholderUser.followingCount,
                                           subscriberType: .following)
                }
                .padding(.horizontal)
                
                RECProfileInfoSheet()
                    .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.qrcode)
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.edit)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.add)
                    }
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
