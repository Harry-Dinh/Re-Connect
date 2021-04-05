//
//  TabBar.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-18.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 40) {
            TabButton(selectedTab: $selectedTab, icon: "checkmark.circle")
            TabButton(selectedTab: $selectedTab, icon: "person.crop.circle")
            TabButton(selectedTab: $selectedTab, icon: "calendar")
            TabButton(selectedTab: $selectedTab, icon: "gearshape")
        }
        .padding()
        .background(
            BlurView()
                .cornerRadius(25)
                .shadow(color: .gray, radius: 5)
                .frame(height: 65)
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
            .preferredColorScheme(.light)
    }
}
