//
//  DeveloperSettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-27.
//

import SwiftUI

struct DeveloperSettingsView: View {
    
    var body: some View {
        List {
            Button("Print following Firebase UID") {
                ProfileVM.shared.fetchFollowings()
            }
            
            Button("Get notifications") {
                NotificationVM.shared.getNotificationsFrom(user: ProfileVM.shared.user)
            }
        }
        .navigationTitle("Developer")
    }
}

struct DeveloperSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSettingsView()
    }
}
