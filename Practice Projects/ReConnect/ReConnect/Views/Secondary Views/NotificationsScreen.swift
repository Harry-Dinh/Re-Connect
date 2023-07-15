//
//  NotificationsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-20.
//

import SwiftUI

struct NotificationsScreen: View {
    
    @ObservedObject private var notificationManager = NotificationManager.shared
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        VStack {
            if !notificationManager.currentUserNotifications.isEmpty {
                List {
                    ForEach(notificationManager.currentUserNotifications) { notification in
                        NotificationView(notificationInfo: RECNotificationWrapper(notification))
                    }
                }
                .listStyle(.grouped)
            } else {
                VStack {
                    Text("You have no unread notifications")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: CUPSystemIcon.filter)
                }
                
                Menu {
                    Button(action: {
                        notificationManager.currentUserNotifications.removeAll()
                    }) {
                        Label("Clear All Notifications", systemImage: CUPSystemIcon.delete)
                    }
                    
                    Button(action: {
                        notificationManager.fetchNotifications(for: loginVM.loggedInUser ?? RECUser.placeholderUser)
                    }) {
                        Label("Refresh", systemImage: CUPSystemIcon.refresh)
                    }
                } label: {
                    Image(systemName: CUPSystemIcon.moreMenu)
                        .symbolVariant(.circle)
                }
            }
        }
        .refreshable {
            notificationManager.fetchNotifications(for: loginVM.loggedInUser ?? RECUser.placeholderUser)
        }
    }
}

struct NotificationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsScreen()
    }
}
