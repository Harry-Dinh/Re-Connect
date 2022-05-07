//
//  NotificationListRowView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-06.
//

import SwiftUI

struct NotificationListRowView: View {
    
    var notificationType: NotificationType
    
    enum NotificationType: Hashable {
        case followerRequest
    }
    
    var body: some View {
        if notificationType == .followerRequest {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.secondary)
                    .font(.system(size: 40))
            }
        }
    }
}

struct NotificationListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListRowView(notificationType: .followerRequest)
    }
}
