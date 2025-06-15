//
//  GeneralSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct GeneralSettingsScreen: View {
    var body: some View {
        List {
            RECListHeader(icon: CUPSystemIcon.settings,
                          renderingMode: .monochrome,
                          title: "General",
                          description: "Customize app appearance, configure accessibility settings to make Re:Connect adapt to your your needs.",
                          isSuperHeader: false)

            Section {
                NavigationLink(destination: AppearanceSettingsScreen()) {
                    Label("Customizations", systemImage: CUPSystemIcon.paintbrush)
                }
            }
        }
        .navigationTitle("General")
    }
}

struct GeneralSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsScreen()
    }
}
