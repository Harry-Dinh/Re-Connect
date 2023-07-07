//
//  RECNotification.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-07.
//

import Foundation

struct RECNotification: Identifiable {
    var id: String
    var title: String
    var notificationDescription: String
    var iconURL: String
    var notificationType: String
    var actions: [String]
    
    init() {
        self.id = UUID().uuidString
        self.title = "Generic Notification Title"
        self.notificationDescription = "Generic notification description"
        self.iconURL = CUPSystemIcon.appNotificationBadge
        self.notificationType = RECNotificationTypes.generic
        self.actions = []
    }
}
