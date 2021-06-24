//
//  CustomTableRow.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-13.
//

import SwiftUI

struct CustomTableRow: View {
    
    var icon: String?
    var title: String
    var backgroundColor: Color
    
    var body: some View {
        HStack {
            ZStack {
                Circle()
                    .frame(width: 35, height: 35)
                    .foregroundColor(backgroundColor)
                Image(systemName: icon!)
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
            
            VStack(alignment: .leading) {
                Text(title)
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .imageScale(.small)
                .foregroundColor(.secondary)
        }
    }
}

struct CustomTableRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomTableRow(icon: "lock.fill", title: "iConnect", backgroundColor: Color(.systemTeal))
    }
}
