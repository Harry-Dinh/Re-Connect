//
//  RECNotification.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-07.
//

import Foundation

/// An object that represents a users notification in Re:Connect. This is the model that is used for notification screen as well as the ones in iOS Notification Center.
struct RECNotification: Identifiable {
    
    public class Property {
        static let id = "id"
        static let title = "title"
        static let notificationDescription = "description"
        static let iconURL = "iconURL"
        static let notificationType = "notificationType"
        static let actions = "actions"
        static let datePosted = "datePosted"
    }
    
    var id: String
    var title: String
    var notificationDescription: String
    var iconURL: String
    var notificationType: String
    var actions: [String]
    var datePosted: String
    
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }()
    
    init() {
        self.id = UUID().uuidString
        self.title = "Generic Notification Title"
        self.notificationDescription = "Generic notification description"
        self.iconURL = CUPSystemIcon.appNotificationBadge
        self.notificationType = RECNotificationTypes.generic
        self.actions = []
        self.datePosted = RECNotification.dateFormatter.string(from: Date())
    }
    
    init(title: String, notificationDescription: String, iconURL: String, notificationType: String, actions: [String], datePosted: String) {
        self.id = UUID().uuidString
        self.title = title
        self.notificationDescription = notificationDescription
        self.iconURL = iconURL
        self.notificationType = notificationType
        self.actions = actions
        self.datePosted = datePosted
    }
    
    init(id: String, title: String, notificationDescription: String, iconURL: String, notificationType: String, actions: [String], datePosted: String) {
        self.id = id
        self.title = title
        self.notificationDescription = notificationDescription
        self.iconURL = iconURL
        self.notificationType = notificationType
        self.actions = actions
        self.datePosted = datePosted
    }
    
    public static let placeholder = RECNotification(id: "0000000000000000",
                                                    title: "Generic Notification Title",
                                                    notificationDescription: "Generic notification description",
                                                    iconURL: CUPSystemIcon.settings,
                                                    notificationType: RECNotificationTypes.generic,
                                                    actions: [],
                                                    datePosted: RECNotification.dateFormatter.string(from: Date()))
}
