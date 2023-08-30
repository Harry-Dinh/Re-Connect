//
//  HomeRowView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import SwiftUI

struct HomeSystemListRowView: View {
    
    @ObservedObject var listWrapper: RETSystemListWrapper
    
    var headerIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 30, height: 30)
                .foregroundColor(Color(hex: listWrapper.systemList.accentColor))
            
            Image(systemName: listWrapper.systemList.icon)
                .symbolVariant(.fill)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            headerIcon
            Text(listWrapper.systemList.name)
            
            Spacer()
            
            Text("\(listWrapper.systemList.items.count)")
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}

struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
