//
//  TabBar.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct CoreScreen: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                Home()
            }
            .tabItem { Label("Home", systemImage: "house.fill") }
            .tag(0)
            
            NavigationView {
                Discover()
            }
            .tabItem { Label("Discover", systemImage: "safari.fill") }
            .tag(1)
            
            NavigationView {
                ProfileScreen()
            }
            .tabItem { Label("Profile", systemImage: "person.crop.circle.fill") }
            .tag(2)
            
            NavigationView {
                MenuScreen()
            }
            .tabItem { Label("Menu", systemImage: "list.bullet") }
            .tag(3)
        }
    }
}

struct TabButton: View {
    
    var icon: String
    @Binding var selectedTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedTab = icon
            }
        }, label: {
            VStack(spacing: 6) {
                // Top indicator
                ZStack {
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 45, height: 6)
                    
                    if selectedTab == icon {
                        CustomShape()
                            .fill(Color.accentColor)
                            .frame(width: 45, height: 6)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                    }
                }
                .padding(.bottom, 10)
                
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(selectedTab == icon ? .accentColor : .secondary)
            }
        })
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}
