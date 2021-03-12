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
            TabButton(selectedTab: $selectedTab, icon: "house")
            TabButton(selectedTab: $selectedTab, icon: "safari")
            TabButton(selectedTab: $selectedTab, icon: "calendar")
            TabButton(selectedTab: $selectedTab, icon: "gearshape")
        }
        .padding()
        .background(
            Rectangle().foregroundColor(Color.primary.opacity(0.1)).blur(radius: 40, opaque: true).cornerRadius(23)
        )
    }
}

struct TabButton: View {
    
    @Binding var selectedTab: String
    
    var icon: String
    
    var body: some View {
        Button(action: {
            selectedTab = icon
        }) {
            VStack(spacing: 2) {
                Image(systemName: icon)
                    .font(.title2)
            }
            .foregroundColor(selectedTab == icon ? .blue : .gray)
        }
    }
}

struct Preview: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
