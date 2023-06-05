//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI

struct RECProfileHeader: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    
    var body: some View {
        ZStack {
            RECGradientBackground(colorSet: [editProfileVM.startingColor, editProfileVM.endingColor],
                                         userInfo: loginVM.loggedInUser ?? RECUser.placeholderUser,
                                         infoVisible: false)
            
            HStack(alignment: .center,spacing: 30) {
                if loginVM.loggedInUser?.pfpURL == nil || loginVM.loggedInUser?.pfpURL == "" {
                    Image(systemName: CUPSystemIcon.profile)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.white)
                        .shadow(color: .secondary, radius: 10, x: 0, y: 5)
                } else {
                    // Load image here...
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(loginVM.loggedInUser?.displayName ?? RECUser.placeholderUser.displayName)
                        .font(.system(.title, design: .default, weight: .bold))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 0, y: 5)
                    
                    if loginVM.loggedInUser?.isProtectedAccount ?? RECUser.placeholderUser.isProtectedAccount {
                        Label(loginVM.loggedInUser?.username ?? RECUser.placeholderUser.username,
                              systemImage: "\(CUPSystemIcon.passwordLock).fill")
                        .font(.system(.subheadline, design: .monospaced, weight: .regular))
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 0, y: 5)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        .padding()
    }
}

struct RECProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader()
    }
}
