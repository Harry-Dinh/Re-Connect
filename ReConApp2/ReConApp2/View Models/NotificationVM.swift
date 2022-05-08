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
        var mutableNotification = notification
        
        if mutableNotification.icon.contains(".") {
            mutableNotification.icon = mutableNotification.icon.replacingOccurrences(of: ".", with: "-")
        }
        
        let dateStr = DateFormatter().string(from: mutableNotification.date)
        
        let userNotification: [String: Any] = [
            "title": mutableNotification.title,
            "subtitle": mutableNotification.subtitle,
            "icon": mutableNotification.icon,
            "date": dateStr,
            "type": ReConNotification.notificationTypeToString(notificationType: notification.type)
        ]
        
        databaseRef.child("ReConUsers").child(user.firebaseUID).child("Notifications").childByAutoId().updateChildValues(userNotification)
    }
    
    public func getNotificationsFrom(user: ReConUser) {
        ProfileVM.shared.user.notifications = []
        
        databaseRef.child("ReConUsers").child(user.firebaseUID).child("Notifications").observeSingleEvent(of: .value) { snapshot in
            for case let child as DataSnapshot in snapshot.children {
                guard let value = child.value as? [String: Any] else {
                    print("No notifcation values")
                    return
                }
                
                let dateStr = value["date"] as? String ?? ""
                var icon = value["icon"] as? String ?? ""
                let subtitle = value["subtitle"] as? String ?? ""
                let title = value["title"] as? String ?? ""
                let type = value["type"] as? String ?? ""
                
                let date: Date
                
                if !dateStr.isEmpty {
                    date = DateFormatter().date(from: dateStr)!
                }
                else {
                    date = Date()
                }
                
                if icon.contains("-") {
                    icon = icon.replacingOccurrences(of: "-", with: ".")
                }
                
                let notifi = ReConNotification(title: title, subtitle: subtitle, date: date, icon: icon, type: ReConNotification.stringToNotificationType(stringType: type)!)

                ProfileVM.shared.user.notifications.append(notifi)
            }
        }
    }
}
