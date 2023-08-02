//
//  ThemeBackgroundPreviewScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct ThemeBackgroundPreviewScreen: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            RECThemeBackground()
                .navigationTitle("Theme Background Preview")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .bottom) {
                    Button {
                        dismiss.callAsFunction()
                    } label: {
                        Text("Done")
                            .fontWeight(.semibold)
                            .frame(width: UIScreen.main.bounds.width - 200, height: 30)
                    }
                    .buttonStyle(.borderedProminent)

                }
        }
    }
}

struct ThemeBackgroundPreviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThemeBackgroundPreviewScreen()
    }
}
