//
//  NotificationListView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-06.
//

import SwiftUI

struct NotificationListView: View {
    
    var user: ReConUser
    @ObservedObject private var profileVM = ProfileVM.shared
    @ObservedObject private var notificationVM = NotificationVM.shared
    
    var body: some View {
        NavigationView {
            ZStack {
                if user.notifications.isEmpty {
                    VStack(spacing: 5) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.white, .green)
                            .font(.title2)
                        
                        Text("No new notifications. You're caught up!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .font(.title3)
                    }
                    .padding()
                    .navigationBarTitleDisplayMode(.inline)
                }
                else {
                    List(user.notifications) { notification in
                        NotificationListRowView(notification: notification)
                    }
                    .listStyle(.plain)
                    .refreshable {
                        notificationVM.getNotificationsFrom(user: profileVM.user) { notifications in
                            guard let notifications = notifications else {
                                return
                            }
                            profileVM.user.notifications = notifications
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Notifications")
                        .bold()
                        .font(.title)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    if user.notifications.isEmpty {
                        Button(action: {
                            notificationVM.getNotificationsFrom(user: profileVM.user) { notifications in
                                guard let notifications = notifications else {
                                    return
                                }
                                profileVM.user.notifications = notifications
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
            .onAppear {
                notificationVM.getNotificationsFrom(user: profileVM.user) { notifications in
                    guard let notifications = notifications else {
                        return
                    }
                    profileVM.user.notifications = notifications
                }
            }
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView(user: ReConUser())
            .preferredColorScheme(.dark)
    }
}
