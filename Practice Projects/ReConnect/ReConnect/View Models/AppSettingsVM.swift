//
//  AppSettingsVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import Foundation

class AppSettingsVM: ObservableObject {
    static let viewModel = AppSettingsVM()
    
    public let accountSettingsSection: [RECListRowItem] = [
        RECListRowItem(label: "Account")
    ]
    
    public let appSettingsSection: [RECListRowItem] = [
        RECListRowItem(label: "General"),
        RECListRowItem(label: "Notification"),
        RECListRowItem(label: "Privacy & Security")
    ]
}
