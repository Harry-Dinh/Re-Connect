//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI
import SDWebImageSwiftUI

struct RECProfileHeader: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    
    var body: some View {
        VStack(spacing: 5) {
            if loginVM.loggedInUser?.pfpURL == nil || loginVM.loggedInUser?.pfpURL == "" {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .symbolVariant(.fill)
                    .frame(width: 100, height: 100)
            } else {
                WebImage(url: URL(string: (loginVM.loggedInUser?.pfpURL)!))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }
            
            ZStack {
                RECGradientBackground(colorSet: [editProfileVM.startingColor, editProfileVM.endingColor],
                                             userInfo: loginVM.loggedInUser ?? RECUser.placeholderUser,
                                             infoVisible: true)
            }
            .padding()
        }
    }
}

struct RECProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader()
    }
}
