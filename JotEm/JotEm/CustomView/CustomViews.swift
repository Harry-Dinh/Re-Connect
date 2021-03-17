//
//  CustomViews.swift
//  JotEm
//
//  Created by Harry Dinh on 2021-03-16.
//

import Foundation
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
