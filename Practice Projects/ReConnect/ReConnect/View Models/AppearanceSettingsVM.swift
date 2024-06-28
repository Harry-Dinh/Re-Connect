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
    
    @AppStorage("appAppearanceOption") var appAppearanceOption = 0
    @AppStorage("accentColorOption") var accentColorOption = 0
    
    @Published var customAccentColor = Color.accentColor
    @Published var customStartingColor = Color.red
    @Published var customEndingColor = Color.blue
    
    @Published var showPreviewPage = false
}
