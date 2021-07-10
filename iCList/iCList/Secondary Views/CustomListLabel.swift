//
//  CustomListLabel.swift
//  iCList
//
//  Created by Harry Dinh on 2021-07-04.
//

import SwiftUI

struct CustomListLabel: View {
    
    var icon: Image
    var title: String
    var subtitle: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(backgroundColor)
                icon
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading) {
                if subtitle.isEmpty {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.regular)
                }
                else {
                    Text(title)
                        .font(.headline)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
        }
    }
}

struct CustomListLabel_Previews: PreviewProvider {
    static var previews: some View {
        CustomListLabel(icon: Image(systemName: "list.bullet"), title: "Tasks", subtitle: "Sub", backgroundColor: .blue)
    }
}
