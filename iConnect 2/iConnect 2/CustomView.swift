//
//  CustomEmptyView.swift
//  iConnect 2
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

/// Create a custom  empty view that takes in two optional width and height CGFloats
struct CustomEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    
    var body: some View {
        Text("")
            .frame(width: width, height: height)
    }
}
