//
//  CoreScreen.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-02.
//

import SwiftUI

struct CoreScreen: View {
    
    @State private var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            ZStack {
                Home()
                    .opacity(selectedTab == "house" ? 1 : 0)
                
                Settings()
                    .opacity(selectedTab == "gearshape" ? 1 : 0)
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.all)
        }
    }
}

struct CoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoreScreen()
    }
}
