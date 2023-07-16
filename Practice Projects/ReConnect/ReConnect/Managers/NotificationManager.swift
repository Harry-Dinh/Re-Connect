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
    
    @Published var currentUserNotifications: [RECNotification] = []
    
    private let notificationDatabasePath = Database.database().reference().child(RECDatabaseParentPath.usersNotifications)
    
    public func send(_ notification: RECNotification, to user: RECUser) {
        let notificationData: [String: Any] = [
            "id": notification.id,
            "title": notification.title,
            "description": notification.notificationDescription,
            "iconURL": notification.iconURL,
            "notificationType": notification.notificationType,
            "actions": notification.actions,
            "datePosted": notification.datePosted
        ]
        
        notificationDatabasePath.child(user.getFirebaseUID()).child(notification.id).setValue(notificationData)
    }
    
    public func fetchNotifications(for user: RECUser) {
        self.currentUserNotifications.removeAll()
        
        notificationDatabasePath.child(user.getFirebaseUID()).observeSingleEvent(of: .value) { [weak self] snapshot in
            guard snapshot.hasChildren() else {
                return
            }
            
            for child in snapshot.children {
                guard let childSnapshot = child as? DataSnapshot,
                      let value = childSnapshot.value as? [String: Any] else {
                    return
                }
                
                var notification = RECNotification()
                notification.id = value[RECNotification.Property.id] as? String ?? RECNotification.placeholder.id
                notification.title = value[RECNotification.Property.title] as? String ?? RECNotification.placeholder.title
                notification.notificationDescription = value[RECNotification.Property.notificationDescription] as? String ?? RECNotification.placeholder.notificationDescription
                notification.iconURL = value[RECNotification.Property.iconURL] as? String ?? RECNotification.placeholder.iconURL
                notification.datePosted = value[RECNotification.Property.datePosted] as? String ?? RECNotification.placeholder.datePosted
                notification.notificationType = value[RECNotification.Property.notificationType] as? String ?? RECNotification.placeholder.notificationType
                notification.actions = value[RECNotification.Property.actions] as? [String] ?? RECNotification.placeholder.actions
                
                self?.currentUserNotifications.append(notification)
            }
        }
    }
    
    public func clearAllNotifications(for user: RECUser) {
        notificationDatabasePath.child(user.getFirebaseUID()).removeValue()
    }
}
