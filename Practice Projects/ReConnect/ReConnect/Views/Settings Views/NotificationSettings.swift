//
//  NotificationSettings.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-06-15.
//

import SwiftUI

struct NotificationSettings: View {
    var body: some View {
        List {
            RECListHeader(
                icon: "\(CUPSystemIcon.notification).badge",
                renderingMode: .hierarchical,
                title: "Notifications",
                description: "Control what kind of notifications you would like to receive, or disable them altogether.",
                isSuperHeader: false
            )
            Toggle(isOn: .constant(true)) {
                Text("Enable Notifications")
            }
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
    }
}
