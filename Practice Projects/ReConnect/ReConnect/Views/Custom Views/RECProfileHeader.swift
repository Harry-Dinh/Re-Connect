//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct RECProfileHeader: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    
    var userInfo: RECUser
    
    var body: some View {
        HStack {
            if userInfo.pfpURL == nil || userInfo.pfpURL == "" {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .symbolVariant(.fill)
                    .frame(width: 80, height: 80)
                    .overlay(
                        Circle()
                            .stroke(Color.secondary, lineWidth: 3)
                    )
            } else {
                WebImage(url: URL(string: (userInfo.pfpURL)!))
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.secondary, lineWidth: 3)
                    )
            }
            
            RECProfileBackground(userInfo: userInfo)
        }
        .padding()
    }
}

struct RECProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader(userInfo: RECUser.placeholderUser)
    }
}
