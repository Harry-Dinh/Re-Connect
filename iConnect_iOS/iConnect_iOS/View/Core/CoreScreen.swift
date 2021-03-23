//
//  CoreScreen.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-15.
//

import SwiftUI
import Firebase

struct CoreScreen: View {
    
    @ObservedObject var userModel = RegisterVM.shared
    
    @State private var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            ZStack {
                Home()
                    .opacity(selectedTab == "house" ? 1 : 0)
                
                ProfileScreen()
                    .opacity(selectedTab == "person.crop.circle" ? 1 : 0)
                
                SettingsScreen()
                    .opacity(selectedTab == "gearshape" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBar(selectedTab: $selectedTab)
                .padding()
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
