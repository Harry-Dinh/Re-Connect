//
//  CustomListROw.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-02-20.
//

import SwiftUI

struct CustomListRow: View {
    
    var title: String
    var subtitle: String?
    var iconName: String
    var tintColor: Color
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(.white)
                .padding(7)
                .background(tintColor)
                .cornerRadius(7)
            
            if subtitle != nil {
                VStack(alignment: .leading, spacing: 5) {
                    Text(title)
                    Text(subtitle!)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            else {
                Text(title)
            }
        }
    }
}

struct CustomListRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomListRow(title: "Settings", iconName: "gearshape.fill", tintColor: .gray)
    }
}
