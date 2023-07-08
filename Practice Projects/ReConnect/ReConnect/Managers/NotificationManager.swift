//
//  NotificationManager.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-08.
//

import Foundation
import FirebaseDatabase

class NotificationManager: ObservableObject {
    public static let shared = NotificationManager()
    
    private let notificationDatabasePath = Database.database().reference().child(RECDatabaseParentPath.usersNotifications)
    
    public func send(_ notification: RECNotification, to user: RECUser) {
        let notificationData: [String: Any] = [
            "title": notification.title,
            "description": notification.notificationDescription,
            "iconURL": notification.iconURL,
            "notificationType": notification.notificationType,
            "actions": notification.actions,
            "datePosted": notification.datePosted
        ]
        
        notificationDatabasePath.child(user.getFirebaseUID()).child(notification.id).setValue(notificationData)
    }
}
