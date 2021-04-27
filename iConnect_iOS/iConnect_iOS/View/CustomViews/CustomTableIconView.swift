//
//  CustomTableIconView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-03.
//

import SwiftUI

struct CustomTableIcon: View {
    
    var backgroundColor: Color = .gray
    var icon: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 35, height: 35)
                .foregroundColor(backgroundColor)
            
            Image(systemName: icon)
                .foregroundColor(.white)
        }
    }
}

struct CustomIconPreview: PreviewProvider {
    static var previews: some View {
        CustomTableIcon(backgroundColor: .blue, icon: "hammer.fill")
    }
}
