//
//  RECBackgroundTheme.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct RECThemeBackground: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    var showBottomColor: Bool
    
    var body: some View {
        if showBottomColor {
            LinearGradient(colors: [editProfileVM.themeStartingColor, Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), editProfileVM.themeEndingColor], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        } else {
            LinearGradient(colors: [editProfileVM.themeStartingColor, Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground), Color(.systemBackground)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

struct RECBackgroundTheme_Previews: PreviewProvider {
    static var previews: some View {
        RECThemeBackground(showBottomColor: true)
    }
}
