//
//  RECConstants.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-05-18.
//

import SwiftUI

class RECNumericConstants {
    static let verifiedNumFollowers: Int = 1000
}

class RECThemeColor {
    static let defaultAccentColor: Color = .accentColor
}

class RECConstants {
    static var isUIiPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }

    static var isUIiPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
