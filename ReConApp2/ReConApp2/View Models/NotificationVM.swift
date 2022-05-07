//
//  NotificationVM.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-07.
//

import Foundation
import Firebase

class NotificationVM: ObservableObject {
    static let shared = NotificationVM()
    
    private let currentUser = ProfileVM.shared.user
    
    private let databaseRef = Database.database().reference()
    
    public func insertNotification(notification: ReConNotification, user: ReConUser) {
        
        let userNotification: [String: Any] = [
            UUID().uuidString: [
                "title": notification.title,
                "subtitle": notification.subtitle,
                "icon": notification.icon,
                "systemIcon": notification.systemIcon,
                "date": DateFormatter().string(from: notification.date),
                "type": ReConNotification.notificationTypeToString(notificationType: notification.type)
            ]
        ]
        
        databaseRef.child("ReConUsers").child(user.firebaseUID).child("Notifications").updateChildValues(userNotification)
    }
}
