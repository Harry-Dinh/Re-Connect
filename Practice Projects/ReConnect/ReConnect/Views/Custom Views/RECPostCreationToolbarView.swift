//
//  RECPostCreationToolbarView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-29.
//

import SwiftUI

struct RECPostCreationToolbarView: View {

    var showKeyboardDismissButton: Bool
    @FocusState.Binding var isKeyboardFocused: Bool?

    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "photo.on.rectangle.angled")
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "textformat")
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "person.2.badge.plus")
            }

            Spacer()

            Button(action: {}) {
                Image(systemName: "gearshape")
            }

            // Show the keyboard dismiss button if the toolbar is on the keyboard
            if showKeyboardDismissButton {
                Spacer()
                Button(action: {
                    isKeyboardFocused = nil
                }) {
                    Image(systemName: "keyboard.chevron.compact.down")
                }
            }
        }
    }
}

//struct RECPostCreationToolbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        RECPostCreationToolbarView(showKeyboardDismissButton: false, isKeyboardFocused: )
//            .padding()
//    }
//}
