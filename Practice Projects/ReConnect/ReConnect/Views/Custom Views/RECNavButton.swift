//
//  RECNavButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-29.
//

import SwiftUI

struct RECNavButton: View {
    
    let iconName: String
    var action: () -> Void
    
    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.viewModel
    
    var body: some View {
        if appearanceSettingsVM.useThemeBackground {
            Button(action: action) {
                Image(systemName: iconName)
                    .foregroundColor(.white)
            }
            .buttonStyle(.bordered)
            .clipShape(Circle())
        } else {
            Button(action: action) {
                Image(systemName: iconName)
            }
        }
    }
}

struct RECNavButton_Previews: PreviewProvider {
    static var previews: some View {
        RECNavButton(iconName: CUPSystemIcon.archive, action: {})
    }
}
