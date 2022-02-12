//
//  CustomEmptyView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-12.
//

import SwiftUI

struct CustomEmptyView: View {
    
    var width: CGFloat?
    var height: CGFloat?
    var color: Color?
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(color == nil ? color : .clear)
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView(width: nil, height: nil, color: nil)
    }
}
