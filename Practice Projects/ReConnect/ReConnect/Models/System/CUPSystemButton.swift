//
//  CUPSystemButton.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-05-10.
//

import SwiftUI

enum CUPSystemButton {
    case dismissKeyboardAndDoneText
    case dismissKeyboardIcon
    case cancelButtonText
    case cancelButtonIcon
    case cancelButtonIconAlt
    case support
}

class SystemButton {
    static var dismissKeyboardAndDoneTextButton: Text {
        Text("Done")
            .fontWeight(.medium)
    }

    static var dismissKeyboardIconButton: Image {
        Image(systemName: CUPSystemIcon.dismissKeyboard)
    }

    static var cancelTextButton: Text {
        Text("Cancel")
    }

    static var cancelIconButton: Image {
        Image(systemName: CUPSystemIcon.cancelAlt)
    }

    static var cancelIconButtonAlt: some View {
        Image(systemName: CUPSystemIcon.cancel)
            .imageScale(.small)
            .padding(5)
            .fontWeight(.bold)
            .background {
                Circle()
                    .foregroundStyle(Color(.systemGray5))
            }
    }

    static var support: Image {
        Image(systemName: CUPSystemIcon.userRequestAction)
    }
}
