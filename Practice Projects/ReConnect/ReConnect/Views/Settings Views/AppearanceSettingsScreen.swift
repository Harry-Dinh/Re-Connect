//
//  AppearanceSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct AppearanceSettingsScreen: View {
    @ObservedObject private var appSettingsManager = AppSettingsManager.instance
    @ObservedObject private var viewModel = AppearanceSettingsVM.instance
    
    var body: some View {
        Form {
            appAppearanceSection()
            accentColorSection()
        }
        .navigationTitle("Customizations")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func appAppearanceSection() -> some View {
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
    }

    private func accentColorSection() -> some View {
        Group {
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
                        .onChange(of: viewModel.customAccentColor) { _ in
                            appSettingsManager.saveCustomAccentColor(viewModel.customAccentColor)
                        }
                } footer: {
                    Text("The new accent color will not take effect until you quit the app.")
                }
            }
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
