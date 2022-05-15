//
//  NotificationListRowView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-06.
//

import SwiftUI
import SDWebImageSwiftUI

struct NotificationListRowView: View {
    
    var notification: ReConNotification
    
    var body: some View {
        if notification.type == .followerRequest {
            HStack {
                Image(systemName: "person.fill.questionmark")
                    .font(.system(size: 25))
                    .symbolRenderingMode(.hierarchical)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(notification.title)
                        .font(.headline)
                    
                    if notification.subtitle != "" {
                        Text(notification.subtitle)
                            .font(.subheadline)
                    }
                    
                    HStack {
                        Button(action: {}) {
                            Text("Accept")
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button(action: {}) {
                            Text("Decline")
                        }
                        .buttonStyle(.bordered)
                        
                        Button(action: {}) {
                            Text("View Profile")
                        }
                        .buttonStyle(.bordered)
                    }
                    .controlSize(.small)
                }
            }
            .padding(.vertical, 7)
        }
        else {
            
        }
    }
}

struct NotificationListRowView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListRowView(notification: ReConNotification(title: "Link Miyamoto has requested to follow you", subtitle: "", date: Date(), icon: "https://firebasestorage.googleapis.com:443/v0/b/reconnect-d8041.appspot.com/o/Profile%20Pics%2FX7v7Bfdfi1Yx46ZGWlYF8tgVDuL2?alt=media&token=2455f09a-5828-4bda-8965-cc328cd34706", type: .followerRequest))
    }
}
