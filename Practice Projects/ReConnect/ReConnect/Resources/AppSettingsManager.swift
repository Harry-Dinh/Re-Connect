//
//  AppSettingsManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-06-15.
//

import SwiftUI

class AppSettingsManager: ObservableObject {
    public static let instance = AppSettingsManager()
    public static let customAccentColorKey = "customAccentColorKey"

    @ObservedObject private var appearanceSettingsVM = AppearanceSettingsVM.instance

    private let userDefaults = UserDefaults.standard

    @Published var appAccentColor: Color = RECThemeColor.defaultAccentColor

    public func saveCustomAccentColor(_ color: Color) {
        let customColorHexValue = color.toHex()
        userDefaults.set(customColorHexValue, forKey: AppSettingsManager.customAccentColorKey)
    }

    public func loadCustomAccentColor() {
        if appearanceSettingsVM.accentColorOption == 1 {
            guard let accentColorHex = userDefaults.string(forKey: AppSettingsManager.customAccentColorKey),
                  let accentColor = Color(hex: accentColorHex) else {
                return
            }
            self.appAccentColor = accentColor
        }
    }

    public func loadAllUserSettings() {
        loadCustomAccentColor()
    }
}
