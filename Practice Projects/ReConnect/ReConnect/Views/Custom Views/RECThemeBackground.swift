//
//  RECBackgroundTheme.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct RECThemeBackground: View {
    
    @ObservedObject private var editProfileVM = EditProfileScreenVM.viewModel
    
    var body: some View {
        VStack {
            LinearGradient(colors: [editProfileVM.themeStartingColor, editProfileVM.themeEndingColor], startPoint: .leading, endPoint: .trailing)
                .blur(radius: 15)
                .frame(height: 120)
                .offset(y: -10)
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct RECBackgroundTheme_Previews: PreviewProvider {
    static var previews: some View {
        RECThemeBackground()
    }
}
