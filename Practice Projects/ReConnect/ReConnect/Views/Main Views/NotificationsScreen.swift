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
        NavigationStack {
            ZStack {
                if notificationManager.currentUserNotifications.isEmpty {
                    Text("You have no new notifications")
                        .font(.title2)
                        .foregroundColor(.secondary)
                }
                
                List {
                    ForEach(notificationManager.currentUserNotifications) { notification in
                        NotificationRowView(notificationInfo: RECNotificationWrapper(notification))
                    }
                }
                .listStyle(.grouped)
                .navigationTitle("Notifications")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            notificationManager.currentUserNotifications.removeAll()
                            guard let currentUser = loginVM.currentUser else {
                                return
                            }
                            notificationManager.clearAllNotifications(for: currentUser)
                        }) {
                            Image(systemName: CUPSystemIcon.delete)
                        }
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            Image(systemName: CUPSystemIcon.filter)
                        }
                    }
                }
                .refreshable {
                    notificationManager.fetchNotifications(for: loginVM.currentUser ?? RECUser.placeholderUser)
                }
                .background(.clear)
            }
        }
    }
}

struct NotificationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsScreen()
    }
}
