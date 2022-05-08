//
//  NotificationListView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-06.
//

import SwiftUI

struct NotificationListView: View {
    
    var notificationList: [ReConNotification]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notificationList) { notification in
                    NotificationListRowView(notification: notification)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Notifications")
                        .font(.title)
                        .bold()
                }
            }
            .refreshable {
                NotificationVM.shared.getNotificationsFrom(user: ProfileVM.shared.user)
            }
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView(notificationList: [])
    }
}
