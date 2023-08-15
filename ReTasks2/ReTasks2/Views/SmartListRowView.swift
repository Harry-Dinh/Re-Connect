//
//  SmartListRowView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct SmartListRowView: View {
    
    let smartList: RETSmartList
    
    var body: some View {
        Label {
            Text(smartList.name)
        } icon: {
            Image(systemName: smartList.icon)
                .foregroundColor(smartList.color)
        }
    }
}

struct SmartListRowView_Previews: PreviewProvider {
    static var previews: some View {
        SmartListRowView(smartList: RETSmartList.placeholder)
    }
}
