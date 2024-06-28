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
            
            if viewModel.accentColorOption == 1 {
                Section {
                    ColorPicker("Custom Accent Color", selection: $viewModel.customAccentColor)
                }
            }
        }
        .navigationTitle("Customizations")
        .navigationBarTitleDisplayMode(.inline)
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
