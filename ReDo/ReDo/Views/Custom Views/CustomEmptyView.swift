//
//  CustomEmptyView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-02-25.
//

import SwiftUI

struct CustomEmptyView: View {
    
    var height: CGFloat?
    var width: CGFloat?
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: width, height: height)
    }
}

struct CustomEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEmptyView()
    }
}
