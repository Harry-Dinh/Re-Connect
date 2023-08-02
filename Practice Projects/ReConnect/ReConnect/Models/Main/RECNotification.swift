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
    
    // MARK: - FIELDS
    
    /// The required variable to conform to the Identifiable protocol.
    var id: String
    
    /// The title of the notification, it helps summarize the content of the notification.
    var title: String
    
    /// A short but detailed description of the notification title.
    var notificationDescription: String
    
    /// The icon of the notification, describing the type of notification to the user at a glance.
    var iconURL: String
    
    /// A string whose value matches one of the values of the fields in `RECNotificationTypes`. This lets the app know what type of notification it is.
    var notificationType: String
    
    /// An array of special strings that matches the values of the fields in `RECNotificationActions` that let the app knows what action buttons should be displayed for that notification.
    var actions: [String]
    
    ///The date and time that the notification was posted. The string value is derived from a `Date` object in Swift.
    var datePosted: String
    
    /// An instance of the `DateFormatter` object that formats the date and time correctly for notifications.
    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter
    }()
    
    // MARK: - INITIALIZERS
    
    /// Creates a generic notification.
    init() {
        self.id = UUID().uuidString
        self.title = "Generic Notification Title"
        self.notificationDescription = "Generic notification description"
        self.iconURL = CUPSystemIcon.appNotificationBadge
        self.notificationType = RECNotificationTypes.generic
        self.actions = []
        self.datePosted = RECNotification.dateFormatter.string(from: Date())
    }
    
    /// Creates a notification with all fields initialized except for the unique ID.
    init(title: String, notificationDescription: String, iconURL: String, notificationType: String, actions: [String], datePosted: String) {
        self.id = UUID().uuidString
        self.title = title
        self.notificationDescription = notificationDescription
        self.iconURL = iconURL
        self.notificationType = notificationType
        self.actions = actions
        self.datePosted = datePosted
    }
    
    /// Creates a notification with all fields initialized.
    init(id: String, title: String, notificationDescription: String, iconURL: String, notificationType: String, actions: [String], datePosted: String) {
        self.id = id
        self.title = title
        self.notificationDescription = notificationDescription
        self.iconURL = iconURL
        self.notificationType = notificationType
        self.actions = actions
        self.datePosted = datePosted
    }
    
    // MARK: - GENERIC OBJECT
    
    /// A placeholder notification to work with SwiftUI previews when there's no data to work with.
    public static let placeholder = RECNotification(id: "0000000000000000",
                                                    title: "Generic Notification Title",
                                                    notificationDescription: "Generic notification description",
                                                    iconURL: CUPSystemIcon.settings,
                                                    notificationType: RECNotificationTypes.generic,
                                                    actions: [],
                                                    datePosted: RECNotification.dateFormatter.string(from: Date()))
}
