//
//  CustomTabBar.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 30) {
            TabButton(selectedTab: $selectedTab, iconName: "house")
            TabButton(selectedTab: $selectedTab, iconName: "gearshape")
        }
        .padding()
        .background(
            BlurView()
                .cornerRadius(25)
                .shadow(color: Color(.systemGray4), radius: 5)
                .frame(height: 65)
        )
    }
}

struct TabButton: View {
    
    @Binding var selectedTab: String
    var iconName: String
    
    var body: some View {
        Button(action: {
            selectedTab = iconName
        }, label: {
            Image(systemName: iconName)
                .font(.title)
        })
        .foregroundColor(selectedTab == iconName ? .accentColor : .gray)
    }
}
