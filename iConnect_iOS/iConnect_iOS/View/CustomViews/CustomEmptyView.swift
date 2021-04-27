//
//  CustomEmptyView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct CustomEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    var color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}
