//
//  RECProfileBackground.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-14.
//

import SwiftUI

struct RECProfileBackground: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.instance
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject var userInfo: RECUserWrapper
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [editProfileVM.startingColor, editProfileVM.endingColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 115)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.25), lineWidth: 8)
                )
                .cornerRadius(15)
            
            VStack(spacing: 3) {
                Text(userInfo.user.displayName)
                    .font(.system(.title, design: .default, weight: .bold))
                if !userInfo.user.isProtectedAccount {
                    Text(userInfo.user.username)
                        .font(.system(.body, design: .monospaced, weight: .regular))
                } else {
                    Label(userInfo.user.username, systemImage: CUPSystemIcon.passwordLock)
                        .symbolVariant(.fill)
                        .font(.system(.body, design: .monospaced, weight: .regular))
                }
            }
            .foregroundColor(.white)
            .shadow(color: .black, radius: 15, x: 0, y: 3)
            
            if userInfo.user.isVerifiedUser {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Image(systemName: CUPSystemIcon.verificationSeal)
                            .symbolVariant(.fill)
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.green)
                            .imageScale(.large)
                            .shadow(color: Color.black.opacity(0.25), radius: 5, x: 0, y: 3)
                    }
                }
                .padding(8)
                .frame(height: 115)
            }
        }
    }
}

struct RECProfileBackground_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileBackground(userInfo: RECUserWrapper(RECUser.placeholderUser))
            .padding()
    }
}
