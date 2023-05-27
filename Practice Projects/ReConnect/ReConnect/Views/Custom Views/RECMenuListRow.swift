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
            Image(systemName: rowItem.iconStr ?? CUPSystemIcon.settings)
                .foregroundColor(rowItem.tintColor ?? .accentColor)
        }
    }
}

struct RECMenuListRow_Previews: PreviewProvider {
    static var previews: some View {
        RECMenuListRow(rowItem: RECListRowItem.placeholderItem)
    }
}
