//
//  CustomEmptyView.swift
//  Dice Roller
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct CustomEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    
    init(width: CGFloat?) {
        self.width = width
        self.height = nil
    }
    
    init(height: CGFloat?) {
        self.width = nil
        self.height = height
    }
    
    init(width: CGFloat?, height: CGFloat?) {
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView(width: 20)
    }
}
