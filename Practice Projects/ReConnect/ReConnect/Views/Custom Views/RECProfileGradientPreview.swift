//
//  RECGradientBackgroundPreview.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct RECProfileGradientPreview: View {
    
    var colorSet: [Color]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: colorSet, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(height: 115)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white.opacity(0.25), lineWidth: 8)
                )
                .cornerRadius(15)
        }
    }
}

struct RECGradientBackgroundPreview_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileGradientPreview(colorSet: [.cyan, .purple])
            .padding()
    }
}
