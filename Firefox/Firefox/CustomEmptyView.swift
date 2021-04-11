//
//  CustomEmptyView.swift
//  Firefox
//
//  Created by Harry Dinh on 2021-04-10.
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
