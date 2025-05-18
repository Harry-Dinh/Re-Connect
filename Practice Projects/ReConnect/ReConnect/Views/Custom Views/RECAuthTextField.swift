//
//  RECAuthTextField.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-09.
//

import SwiftUI

struct RECAuthTextField: View {
    
    @Binding var text: String
    var placeholderText: String
    var iconStr: String
    var isSecureTextEntry: Bool
    var identifier: String

    var body: some View {
        Label {
            if !isSecureTextEntry {
                TextField(placeholderText, text: $text)
                    .accessibilityIdentifier(identifier)
            } else {
                SecureField(placeholderText, text: $text)
                    .accessibilityIdentifier(identifier)
            }
        } icon: {
            Image(systemName: iconStr)
                .foregroundColor(.primary)
        }
        .padding(.vertical, 7)
    }
}

struct RECAuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        RECAuthTextField(
            text: .constant(""),
            placeholderText: "Placeholder",
            iconStr: "square",
            isSecureTextEntry: false,
            identifier: "NCC-1701"
        )
        .padding()
    }
}
