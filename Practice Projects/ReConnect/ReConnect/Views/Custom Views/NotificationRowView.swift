//
//  RECNotificationView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-15.
//

import SwiftUI

struct NotificationRowView: View {
    
    @ObservedObject var notificationInfo: RECNotificationWrapper
    
    var body: some View {
        HStack {
            Image(systemName: notificationInfo.notification.iconURL)
                .foregroundColor(.accentColor)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(notificationInfo.notification.title)
                    .font(.headline)
                Text(notificationInfo.notification.notificationDescription)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                
                // Show the accept and decline follower request buttons if the notification type is a follower request
                if notificationInfo.notification.notificationType == RECNotificationTypes.followerRequest {
                    HStack {
                        Button("Accept") {}
                            .buttonStyle(.borderedProminent)
                        
                        Button("Decline") {}
                            .buttonStyle(.bordered)
                    }
                }
            }
        }
    }
}

struct RECNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRowView(notificationInfo: RECNotificationWrapper(RECNotification.placeholder))
            .padding()
    }
}
