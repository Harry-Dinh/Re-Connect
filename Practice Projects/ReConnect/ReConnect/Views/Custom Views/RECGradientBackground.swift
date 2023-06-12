//
//  RECGradientBackgroundPreview.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct RECGradientBackground: View {
    
    var colorSet: [Color]
    var userInfo: RECUser
    var infoVisible: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(colors: colorSet, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 115)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.white.opacity(0.25), lineWidth: 8)
                )
                .cornerRadius(7)
            
            if infoVisible {
                VStack(spacing: 3) {
                    Text(userInfo.displayName)
                        .foregroundColor(.white)
                        .font(.system(.largeTitle, design: .default, weight: .bold))
                        .shadow(color: .black, radius: 8, x: 0, y: 5)
                }
                
                Text(userInfo.username)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.system(.subheadline, design: .monospaced, weight: .regular))
                    .italic()
                    .offset(x: -110, y: -37)
                    .shadow(color: .black, radius: 8, x: 0, y: 5)
                
                if userInfo.isVerifiedUser {
                    Image(systemName: CUPSystemIcon.verificationSeal)
                        .symbolVariant(.fill)
                        .foregroundStyle(Color.green.gradient)
                        .offset(x: 155, y: 37)
                        .shadow(color: .black, radius: 5, x: 0, y: 3)
                }
            }
        }
    }
}

struct RECGradientBackgroundPreview_Previews: PreviewProvider {
    static var previews: some View {
        RECGradientBackground(colorSet: [.cyan, .purple], userInfo: RECUser.placeholderUser, infoVisible: true)
            .padding()
    }
}
