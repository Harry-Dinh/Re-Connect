//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct RECOtherUserHeader: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    @ObservedObject var userInfo: RECUserWrapper
    
    var body: some View {
        HStack {
            ZStack {
                if userInfo.user.pfpURL == nil || userInfo.user.pfpURL == "" {
                    Image(systemName: CUPSystemIcon.profile)
                        .resizable()
                        .symbolVariant(.fill)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Circle()
                                .stroke(Color.secondary, lineWidth: 3)
                        )
                } else {
                    AsyncImage(url: URL(string: userInfo.user.pfpURL!)) { image in
                        image.resizable()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.secondary, lineWidth: 3)
                            )
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80, height: 80)
                }
            }
            
            RECOtherUserBackground(userInfo: userInfo)
        }
        .padding()
    }
}

struct RECOtherUserHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
