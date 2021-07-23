//
//  CustomListRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct CustomListRow: View {
    
    var hasIcon: Bool
    var showsChevron: Bool
    var icon: String
    var title: String
    var color: Color
    
    var body: some View {
        HStack {
            if hasIcon {
                ZStack {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(color)
                    
                    Image(systemName: icon)
                        .foregroundColor(.white)
                }
            }
            
            Text(title)
                .foregroundColor(.primary)
            
            Spacer()
            
            if showsChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .imageScale(.small)
            }
        }
        .frame(height: 40)
    }
}

struct CustomListRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            GroupBox(label: Text("Navigation Links & Toggle"), content: {
                CustomListRow(hasIcon: true, showsChevron: true, icon: "star.fill", title: "With icon", color: .blue)
                
                CustomListRow(hasIcon: false, showsChevron: true, icon: "star.fill", title: "Without icon", color: .clear)
            })
            .cornerRadius(15)
            .padding()
        }
    }
}
