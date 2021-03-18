//
//  TabBar.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 40) {
            TabButton(selectedTab: $selectedTab, icon: "house")
            TabButton(selectedTab: $selectedTab, icon: "gearshape")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color.primary.opacity(0.1))
        )
    }
}

struct TabButton: View {
    
    @Binding var selectedTab: String
    var icon: String
    
    var body: some View {
        Button(action: {
            selectedTab = icon
        }, label: {
            Image(systemName: icon)
                .font(.title2)
        })
        .foregroundColor(selectedTab == icon ? .green : .gray)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
