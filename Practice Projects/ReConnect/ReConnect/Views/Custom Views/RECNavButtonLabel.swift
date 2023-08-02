//
//  RECNavButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-29.
//

import SwiftUI

struct RECNavButtonLabel: View {
    
    let iconName: String
    
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.viewModel
    
    var body: some View {
        if appearanceSettingsVM.useThemeBackground {
            Image(systemName: iconName)
                .foregroundColor(.accentColor)
                .padding(7)
                .background(
                    Circle()
                        .foregroundColor(Color(.systemGray5))
                )
        } else {
            Image(systemName: iconName)
                .foregroundColor(.accentColor)
        }
    }
}

struct RECNavButton_Previews: PreviewProvider {
    static var previews: some View {
        RECNavButtonLabel(iconName: CUPSystemIcon.archive)
    }
}
