//
//  RECMenuListRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct RECMenuListRow: View {
    
    let rowItem: RECListRowItem
    
    var body: some View {
        Label {
            Text(rowItem.label)
        } icon: {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 30, height: 30)
                    .foregroundColor(rowItem.tintColor?.opacity(0.25) ?? RECListRowItem.placeholderItem.tintColor?.opacity(0.25))
                
                Image(systemName: rowItem.iconStr ?? CUPSystemIcon.settings)
                    .foregroundColor(rowItem.tintColor ?? RECListRowItem.placeholderItem.tintColor)
            }
        }
    }
}

struct RECMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        RECMenuListRow(rowItem: RECListRowItem.placeholderItem)
    }
}
