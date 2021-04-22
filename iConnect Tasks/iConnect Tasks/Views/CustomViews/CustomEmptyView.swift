//
//  CustomEmptyView.swift
//  iConnect Tasks
//
//  Created by Harry Dinh on 2021-04-18.
//

import SwiftUI

struct CustomEmptyView: View {
    var width: CGFloat?
    var height: CGFloat?
    var foregroundColor: Color
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(foregroundColor)
    }
}
