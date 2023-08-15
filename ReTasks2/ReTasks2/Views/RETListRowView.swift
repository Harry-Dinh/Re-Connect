//
//  RETListRowView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct RETListRowView: View {
    
    @ObservedObject var list: RETListWrapper
    
    var body: some View {
        Label {
            Text(list.list.name)
        } icon: {
            if list.list.icon == nil {
                Image(systemName: "list.dash")
                    .foregroundColor(Color(hex: list.list.color))
                    .fontWeight(.bold)
            } else {
                Text(list.list.icon!)
                    .font(.system(size: 17))
                    .foregroundColor(Color(hex: list.list.color))
            }
        }
    }
}

struct RETListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RETListRowView(list: RETListWrapper(RETList.placeholder))
    }
}
