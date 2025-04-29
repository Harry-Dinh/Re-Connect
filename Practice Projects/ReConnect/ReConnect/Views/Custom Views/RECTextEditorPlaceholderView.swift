//
//  RECTextEditorPlaceholderView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-28.
//

import SwiftUI

struct RECTextEditorPlaceholderView: View {

    @Binding var textToDetect: String
    var placeholderText: String

    var body: some View {
        VStack {
            HStack {
                if textToDetect.isEmpty {
                    if #available(iOS 17.0, *) {
                        Text(placeholderText)
                            .foregroundStyle(.placeholder)  // This is more in-line with the iOS 17 (and above) placeholder colour
                    } else {
                        Text(placeholderText)
                            .foregroundStyle(.secondary)    // Use this instead of .placeholder for iOS 16
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding()
    }
}

struct RECTextEditorPlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        RECTextEditorPlaceholderView(textToDetect: .constant(""), placeholderText: "Placeholder Text")
    }
}
