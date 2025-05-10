//
//  RECSystemButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-05-10.
//

import SwiftUI

struct RECSystemButton: View {

    var systemButton: CUPSystemButton
    var action: () -> Void

    init(_ systemButton: CUPSystemButton, action: @escaping () -> Void) {
        self.systemButton = systemButton
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            switch systemButton {
                case .dismissKeyboardText:
                    Text("Done")
                        .fontWeight(.medium)
                case .dismissKeyboardIcon:
                    Image(systemName: CUPSystemIcon.dismissKeyboard)
                case .cancelButtonText:
                    Text("Cancel")
                case .cancelButtonIcon:
                    Image(systemName: CUPSystemIcon.cancelAlt)
                case .cancelButtonIconAlt:
                    Image(systemName: CUPSystemIcon.cancel)
                        .imageScale(.small)
                        .padding(5)
                        .fontWeight(.bold)
                        .background {
                            Circle()
                                .foregroundStyle(Color(.systemGray5))
                        }
                default:
                    Image(systemName: CUPSystemIcon.userRequestAction)
            }
        }
        .foregroundStyle(systemButton == .cancelButtonIconAlt ? Color.secondary : Color.accentColor)
//        .controlSize(systemButton == .cancelButtonIconAlt ? .small : .regular)
    }
}

#Preview {
    RECSystemButton(.cancelButtonIconAlt, action: {})
}
