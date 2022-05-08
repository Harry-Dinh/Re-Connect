//
//  ReConNotification.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-07.
//

import Foundation
import UIKit

struct ReConNotification: Identifiable {
    
    public enum NotificationType: Hashable {
        case followerRequest
        case others
    }
    
    init() {
        id = UUID()
        title = ""
        subtitle = ""
        date = Date()
        icon = ""
        type = .others
    }
    
    init(title: String, subtitle: String, date: Date, type: NotificationType) {
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.date = date
        icon = ""
        self.type = type
    }
    
    init(title: String, subtitle: String, date: Date, icon: String, type: NotificationType) {
        id = UUID()
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.icon = icon
        self.type = type
    }
    
    var id: UUID
    var title: String
    var subtitle: String
    var date: Date
    var icon: String
    var type: NotificationType
    
    public static func notificationTypeToString(notificationType: NotificationType) -> String {
        switch notificationType {
        case .followerRequest:
            return "followerRequest"
        case .others:
            return "others"
        }
    }
    
    public static func stringToNotificationType(stringType: String) -> NotificationType? {
        switch stringType {
        case "followerRequest":
            return .followerRequest
        case "others":
            return .others
        default:
            return nil
        }
    }
}
