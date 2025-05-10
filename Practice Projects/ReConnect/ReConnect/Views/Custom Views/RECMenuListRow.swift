//
//  RECMenuListRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct RECMenuListRow: View {
    
    let rowItem: RECListRowItem

    private let rectSize: CGFloat = 35

    var body: some View {
        Label {
            Text(rowItem.label)
        } icon: {
            ZStack {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: rectSize, height: rectSize)
                    .foregroundColor(rowItem.tintColor ?? RECListRowItem.placeholderItem.tintColor)
                
                Image(systemName: rowItem.iconStr ?? CUPSystemIcon.settings)
                    .foregroundStyle(.white)
            }
        }
        .padding(.vertical, 1)
    }
}

struct RECMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
//        RECMenuListRow(rowItem: RECListRowItem.placeholderItem)
        MenuScreen()
    }
}
