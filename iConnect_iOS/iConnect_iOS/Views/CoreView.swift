//
//  Home.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-04.
//

import SwiftUI

struct CoreView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @State private var selectedTab = "house"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            ZStack {
                Home()
                    .opacity(selectedTab == "house" ? 1 : 0)
                
                SettingsView()
                    .opacity(selectedTab == "gearshape" ? 1 : 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            TabBarView(selectedTab: $selectedTab)
                .padding()
        }
    }
}

struct CoreViewPreview: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
