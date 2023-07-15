//
//  AppearanceSettingsVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import Foundation
import SwiftUI

class AppearanceSettingsVM: ObservableObject {
    public static let viewModel = AppearanceSettingsVM()
    
    @AppStorage("useThemeBackground") var useThemeBackground = true
    @AppStorage("themeBackgroundOption") var themeBackgroundOption = 0
    
    @Published var customStartingColor = Color.red
    @Published var customEndingColor = Color.blue
    
    @Published var showPreviewPage = false
}
