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
                ZStack {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(Color(hex: list.list.color))
                    
                    Image(systemName: "list.dash")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            } else {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(hex: list.list.color))
                    
                    Text(list.list.icon!)
                        .font(.system(size: 17))
                }
            }
        }
    }
}

struct RETListRowView_Previews: PreviewProvider {
    static var previews: some View {
        RETListRowView(list: RETListWrapper(RETList.placeholder))
    }
}
