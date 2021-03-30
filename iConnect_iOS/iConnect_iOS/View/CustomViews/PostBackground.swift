//
//  PostBackground.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-26.
//

import SwiftUI

struct PostBackground: View {
    
    var width: CGFloat
    var height: CGFloat
    var cornerRadius: CGFloat
    var foregroundColor: Color? = .clear
    var strokeColor: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(strokeColor)
            .frame(width: width, height: height)
            .foregroundColor(foregroundColor)
    }
}
