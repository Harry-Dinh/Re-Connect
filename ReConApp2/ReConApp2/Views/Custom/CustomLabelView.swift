//
//  CustomLabelView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-15.
//

import SwiftUI

struct CustomLabelView: View {
    
    var icon: String
    var title: String
    var subtitle: String
    var color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.system(size: 25))
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(color)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct CustomLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLabelView(icon: "rectangle.and.pencil.and.ellipsis", title: "Edit Email or Password", subtitle: "The all-in-one tool for editing your email and password!", color: .purple)
    }
}
