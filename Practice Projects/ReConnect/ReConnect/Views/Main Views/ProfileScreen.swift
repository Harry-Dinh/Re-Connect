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
    
    var body: some View {
        NavigationStack {
            ScrollView {
                RECProfileHeader()
                
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
                    Button(action: {
                        editProfileVM.tempUser = loginVM.loggedInUser ?? RECUser.placeholderUser
                        viewModel.showEditProfileScreen.toggle()
                    }) {
                        Image(systemName: CUPSystemIcon.edit)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.add)
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.showEditProfileScreen, content: EditProfileScreen.init)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
