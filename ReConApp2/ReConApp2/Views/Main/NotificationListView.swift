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
            ZStack {
                if notificationList.isEmpty {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("No new notifications. You're caught up!")
                    }
                    .foregroundColor(.secondary)
                }
                else {
                    List {
                        ForEach(notificationList) { notification in
                            NotificationListRowView(notification: notification)
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        NotificationVM.shared.getNotificationsFrom(user: ProfileVM.shared.user) { list in
                            guard let list = list else {
                                return
                            }

                            ProfileVM.shared.user.notifications = list
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Notifications")
                        .font(.title)
                        .bold()
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    if notificationList.isEmpty {
                        Button(action: {
                            NotificationVM.shared.getNotificationsFrom(user: ProfileVM.shared.user) { list in
                                guard let list = list else {
                                    return
                                }

                                ProfileVM.shared.user.notifications = list
                            }
                        }) {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                    else {
                        EditButton()
                    }
                }
            }
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView(notificationList: [])
    }
}
