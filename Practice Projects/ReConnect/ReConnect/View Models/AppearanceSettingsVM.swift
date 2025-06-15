//
//  AppearanceSettingsVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import Foundation
import SwiftUI

class AppearanceSettingsVM: ObservableObject {
    public static let instance = AppearanceSettingsVM()
    
    @AppStorage("appAppearanceOption") var appAppearanceOption = 0
    @AppStorage("accentColorOption") var accentColorOption = 0

    @Published var customAccentColor = Color.accentColor

    public func setColorScheme() -> ColorScheme? {
        if appAppearanceOption == 1 {
            return .light
        } else if appAppearanceOption == 2 {
            return .dark
        } else {
            return nil
        }
    }
}
