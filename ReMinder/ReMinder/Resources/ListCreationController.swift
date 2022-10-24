//
//  ListCreationController.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-23.
//

import Foundation
import UIKit
import SwiftUI

/// A class that responsible for handling operations for creating a `ListItem`
class ListCreationController: ObservableObject {
    
    /// The shared instance of `ListCreationController`
    static let shared = ListCreationController()
    
    /// An instance of `ObjectManager`
    private var objManager = ObjectManager.current
    
    // MARK: - STATIC PROPERTIES
    
    /// The diamater for the circular list icon
    public let circleIconDiameter: CGFloat = 130
    
    /// The maximum number of character for `listIcon` used in the `limitText(_ limit: Int)` method
    public let emojiIconTextLimit: Int = 1
    
    /// The emoji icon options to choose from. More icons will be added over time
    public let emojiOptions: [String] = ["📌", "🧭", "💻", "📅", "💼"]
    
    /// The width of the current screen
    public let screenWidth: CGFloat = UIScreen().bounds.width
    
    /// The height of the current screen
    public let screenHeight: CGFloat = UIScreen().bounds.height
    
    // MARK: - UI PROPERTIES
    
    /// The list's name
    @Published var listName: String = ""
    
    /// The list's emoji icon
    @Published var listIcon: String = ListCreationController.shared.emojiOptions[0]
    
    /// The list's accent color
    @Published var listColor: Color = Color.accentColor
    
    // MARK: - METHODS
    
    /// Limit the number of text entered in the emoji field.
    public func limitText(_ limit: Int) {
        if listIcon.count > limit {
            listIcon = String(listIcon.prefix(limit))
        }
    }
    
    /// Append a new list element to the `userLists` of `ObjectManager` class
    public func createList(list: ListItem) {
        objManager.userLists.append(list)
    }
}
