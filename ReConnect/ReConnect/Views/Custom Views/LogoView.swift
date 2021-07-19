//
//  LogoView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-19.
//

import SwiftUI

struct LogoView: View {
    
    var icon: String
    var color: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 150, height: 150)
                .cornerRadius(30)
                .foregroundColor(Color("offAppearance"))
                .shadow(color: Color.secondary.opacity(0.5), radius: 7, x: 5, y: 5)
                .shadow(color: Color.secondary.opacity(0.25), radius: 7, x: -3, y: -3)
            
            Image(systemName: icon)
                .foregroundColor(color)
                .font(.system(size: 100, weight: .regular, design: .default))
                .shadow(color: color.opacity(0.75), radius: 7, x: 5, y: 5)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView(icon: "star", color: .blue)
    }
}
