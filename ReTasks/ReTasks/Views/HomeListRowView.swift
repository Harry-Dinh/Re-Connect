//
//  HomeRowView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import SwiftUI

struct HomeListRowView: View {
    
    @ObservedObject var listWrapper: RETListWrapper
    
    var headerIcon: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 7)
                .frame(width: 30, height: 30)
                .foregroundColor(Color(hex: listWrapper.list.accentColor))
            
            Image(systemName: listWrapper.list.icon)
                .symbolVariant(.fill)
                .font(.system(size: 16))
                .foregroundColor(.white)
        }
    }
    
    var body: some View {
        HStack(spacing: 15) {
            headerIcon
            Text(listWrapper.list.name)
            
            Spacer()
            
            Text("\(listWrapper.list.items.count)")
                .foregroundColor(.secondary)
                .font(.subheadline)
        }
    }
}

struct HomeListRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
