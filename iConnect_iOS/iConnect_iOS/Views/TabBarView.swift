//
//  TabBarView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 40) {
            TabButton(selectedTab: $selectedTab, title: "Home", icon: "house")
//            TabButton(selectedTab: $selectedTab, title: "Explore", icon: "safari")
            TabButton(selectedTab: $selectedTab, title: "Settings", icon: "gearshape")
        }
        .padding()
        .background(
            Color.gray.blur(radius: 3.0).opacity(0.6).cornerRadius(25)
        )
    }
}

struct TabButton: View {
    
    @Binding var selectedTab: String
    
    var title: String
    var icon: String
    
    var body: some View {
        Button(action: {
            selectedTab = icon
        }) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.title2)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundColor(selectedTab == icon ? .blue : .white)
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
