//
//  AppearanceSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct AppearanceSettingsScreen: View {
    
    @ObservedObject private var viewModel = AppearanceSettingsVM.viewModel
    
    var body: some View {
        List {
            Section {
                Toggle(isOn: $viewModel.useThemeBackground) {
                    Text("Use Theme Background")
                }
            } footer: {
                Text("Turning on theme background will allow you to choose two colors for the bottom and top edges of your device.")
            }
            
            if viewModel.useThemeBackground {
                Button("Preview Theme Background") {
                    viewModel.showPreviewPage.toggle()
                }
                
                Section {
                    Picker(selection: $viewModel.themeBackgroundOption) {
                        Text("Mirror Profile Banner Colors").tag(0)
                        Text("Choose Custom Colors").tag(1)
                    } label: {
                        EmptyView()
                    }
                    .pickerStyle(.inline)
                    
                } header: {
                    Text("Theme Background Options")
                }
            }
            
            if viewModel.themeBackgroundOption == 1 {
                Section {
                    ColorPicker(selection: $viewModel.customStartingColor, supportsOpacity: true) {
                        Text("Top Color")
                    }
                    
                    ColorPicker(selection: $viewModel.customEndingColor, supportsOpacity: true) {
                        Text("Bottom Color")
                    }
                } header: {
                    Text("Choose Custom Colors")
                }
            }
        }
        .navigationTitle("Appearance")
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $viewModel.showPreviewPage) {
            ThemeBackgroundPreviewScreen()
        }
    }
}

struct AppearanceSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AppearanceSettingsScreen()
        }
    }
}
