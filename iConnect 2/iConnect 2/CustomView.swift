//
//  CustomEmptyView.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

/// Create a custom  empty view that takes in two optional width and height CGFloat
struct CustomEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    var color: Color?
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(color)
    }
}
