//
//  CustomViews.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import Foundation
import SwiftUI

struct ICCVEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    var color: Color?
    
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .frame(width: width, height: height)
    }
}
