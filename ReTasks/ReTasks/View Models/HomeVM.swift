//
//  HomeVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import Foundation
import SwiftUI

/// The view model for the `HomeView` file.
class HomeVM: ObservableObject {
    
    // MARK: - PROPERTIES
    
    public static let viewModel = HomeVM()
    
    @Published var systemLists: [RETSystemList] = [
        RETSystemList(id: "0000 0000 0000 0000", name: "Inbox", icon: "tray", accentColor: Color.accentColor.toHex()!),
        RETSystemList(id: "1111 1111 1111 1111", name: "Today", icon: "star", accentColor: Color.orange.toHex()!)
    ]
    
    @Published var userLists: [RETList] = []
    
    // MARK: ASSETS
    
    public let NO_LISTS_ALERT = "You don't have any lists.\nTap the \"New List\" button below to create one."
}
