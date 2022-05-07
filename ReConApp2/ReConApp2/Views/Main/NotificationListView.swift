//
//  NotificationListView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-05-06.
//

import SwiftUI

struct NotificationListView: View {
    var body: some View {
        NavigationView {
            List {
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Notifications")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

struct NotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationListView()
    }
}
