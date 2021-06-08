//
//  LogoView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-07.
//

import SwiftUI

struct LogoView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var imageName: String
    var imageSize: CGFloat
    var displayColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("offWhite"))
                .frame(width: 150, height: 150)
                .cornerRadius(30)
                .shadow(color: colorScheme == .light ? Color.black.opacity(0.5) : Color.white.opacity(0.25), radius: 10, x: 7, y: 10)
                .shadow(color: colorScheme == .light ? Color(.systemGray6).opacity(0.5) : Color(.systemGray2).opacity(0.25), radius: 10, x: -10, y: -20)
            
            Image(systemName: imageName)
                .font(.system(size: imageSize))
                .foregroundColor(displayColor)
                .shadow(color: displayColor.opacity(0.5), radius: 10, x: 7, y: 10)
                .shadow(color: Color(.systemGray6).opacity(0.5), radius: 10, x: -5, y: -10)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(imageName: "lock.circle", imageSize: 100, displayColor: Color("iconnectYellow"))
    }
}
