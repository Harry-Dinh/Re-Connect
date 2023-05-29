//
//  RECGradientBackgroundPreview.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct RECGradientBackgroundPreview: View {
    
    var colorSet: [Color]
    var userInfo: RECUser
    
    var body: some View {
        ZStack {
            LinearGradient(colors: colorSet, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 7)
                        .stroke(Color.white.opacity(0.25), lineWidth: 8)
                )
                .cornerRadius(7)
            
            VStack(spacing: 3) {
                Text(userInfo.displayName)
                    .foregroundColor(.white)
                    .font(.system(.title, design: .default, weight: .bold))
                    .italic()
                    .opacity(0.75)
                
                Text(userInfo.username)
                    .foregroundColor(.white)
                    .opacity(0.75)
            }
        }
    }
}

struct RECGradientBackgroundPreview_Previews: PreviewProvider {
    static var previews: some View {
        RECGradientBackgroundPreview(colorSet: [.green, .yellow], userInfo: RECUser.placeholderUser)
            .padding()
    }
}
