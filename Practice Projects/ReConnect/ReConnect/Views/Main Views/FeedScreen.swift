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
                List {
                    // Posts from followers goes here...
                }
                .navigationTitle("Re:Connect")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {}) {
                            Image(systemName: CUPSystemIcon.filter)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            viewModel.showPostCreationScreen.toggle()
                        }) {
                            Image(systemName: CUPSystemIcon.add)
                                .symbolVariant(.circle)
                                .symbolVariant(.fill)
                        }
                    }
                }
                .sheet(isPresented: $viewModel.showPostCreationScreen, content: PostCreationView.init)
            }
        }
    }
}

struct FeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        FeedScreen()
    }
}
