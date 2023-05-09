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
    
    var body: some View {
        Label {
            if !isSecureTextEntry {
                TextField(placeholderText, text: $text)
            } else {
                SecureField(placeholderText, text: $text)
            }
        } icon: {
            Image(systemName: iconStr)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(.systemGray5))
        )
        .padding(.horizontal)
    }
}

struct RECAuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        RECAuthTextField(text: .constant(""), placeholderText: "Placeholder", iconStr: "square", isSecureTextEntry: false)
            .padding()
    }
}
