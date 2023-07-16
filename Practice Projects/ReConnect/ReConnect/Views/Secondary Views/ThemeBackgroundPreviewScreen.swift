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
            RECThemeBackground(showBottomColor: true)
                .navigationTitle("Theme Background Preview")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Done") {
                            dismiss.callAsFunction()
                        }
                    }
                }
        }
    }
}

struct ThemeBackgroundPreviewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ThemeBackgroundPreviewScreen()
    }
}
