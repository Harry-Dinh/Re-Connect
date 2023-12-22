//
//  FeedScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

struct FeedScreen: View {
    
    @ObservedObject private var viewModel = FeedScreenVM.viewModel
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.viewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                if appearanceSettingsVM.useThemeBackground {
                    RECThemeBackground()
                }
                
                List {
                    
                }
                .navigationTitle("Re:Connect Feed")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {}) {
                            Image(systemName: CUPSystemIcon.filter)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: NotificationsScreen.init) {
                            Image(systemName: CUPSystemIcon.notification)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: CUPSystemIcon.add)
                        }
                    }
                }
            }
        }
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen()
    }
}
