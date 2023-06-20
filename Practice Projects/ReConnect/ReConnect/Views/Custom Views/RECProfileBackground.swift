//
//  RECProfileBackground.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-14.
//

import SwiftUI

struct RECProfileBackground: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var userInfo: RECUser
    
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [editProfileVM.startingColor, editProfileVM.endingColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 115)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.25), lineWidth: 8)
                )
                .cornerRadius(10)
            
            VStack(spacing: 3) {
                Text(userInfo.displayName)
                    .font(.system(.title, design: .default, weight: .bold))
                if !userInfo.isProtectedAccount {
                    Text(userInfo.username)
                        .font(.system(.body, design: .monospaced, weight: .regular))
                } else {
                    Label(userInfo.username, systemImage: CUPSystemIcon.passwordLock)
                        .symbolVariant(.fill)
                        .font(.system(.body, design: .monospaced, weight: .regular))
                }
            }
            .foregroundColor(.white)
            .shadow(color: .black, radius: 10, x: 0, y: 5)
        }
    }
}

struct RECProfileBackground_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileBackground(userInfo: RECUser.placeholderUser)
            .padding()
    }
}
