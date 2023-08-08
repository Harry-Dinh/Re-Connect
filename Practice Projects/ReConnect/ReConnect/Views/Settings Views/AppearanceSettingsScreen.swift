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
            
            // MARK: APP APPEARANCE
            
            Section {
                Picker(selection: $viewModel.appAppearanceOption) {
                    Text("Device Settings").tag(0)
                    Text("Light Mode").tag(1)
                    Text("Dark Mode").tag(2)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.inline)
            } header: {
                Text("App Appearance")
            }
            
            // MARK: ACCENT COLOUR
            
            Section {
                Picker(selection: $viewModel.accentColorOption) {
                    Text("Default").tag(0)
                    Text("Custom Color").tag(1)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.inline)

            } header: {
                Text("Accent Color")
            }
            
            // MARK: CUSTOM ACCENT COLOR
            
            if viewModel.accentColorOption == 1 {
                Section {
                    ColorPicker("Custom Accent Color", selection: $viewModel.customAccentColor)
                }
            }
            
            // MARK: THEME BACKGROUND
            
            Section {
                Toggle(isOn: $viewModel.useThemeBackground) {
                    Text("Use Theme Background")
                }
                
                if viewModel.useThemeBackground {
                    Button("Preview Theme Background") {
                        viewModel.showPreviewPage.toggle()
                    }
                }
            } header: {
                Text("Theme Background")
            } footer: {
                Text("Turning on theme background will allow you to choose two colors for the top edge of the device.")
            }
            
            if viewModel.useThemeBackground {
                
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
                        Text("Color 1")
                    }
                    
                    ColorPicker(selection: $viewModel.customEndingColor, supportsOpacity: true) {
                        Text("Color 2")
                    }
                } header: {
                    Text("Choose Custom Colors")
                }
            }
        }
        .navigationTitle("Customizations")
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
                .preferredColorScheme(.dark)
        }
    }
}
