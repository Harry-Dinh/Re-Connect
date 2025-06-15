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
                case .dismissKeyboardAndDoneText:
                    SystemButton.dismissKeyboardAndDoneTextButton
                case .dismissKeyboardIcon:
                    SystemButton.dismissKeyboardIconButton
                case .cancelButtonText:
                    SystemButton.cancelTextButton
                case .cancelButtonIcon:
                    SystemButton.cancelTextButton
                case .cancelButtonIconAlt:
                    SystemButton.cancelIconButtonAlt
                default:
                    SystemButton.support
            }
        }
        .foregroundStyle(systemButton == .cancelButtonIconAlt ? Color.secondary : Color.accentColor)
    }
}

#Preview {
    RECSystemButton(.cancelButtonIconAlt, action: {})
}
