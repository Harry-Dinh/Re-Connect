//
//  NotificationsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-20.
//

import SwiftUI

struct NotificationsScreen: View {
    var body: some View {
        List {
            
        }
        .navigationTitle("Notifications")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: CUPSystemIcon.filter)
                }
                
                Menu {
                    Button(action: {}) {
                        Label("Clear All Notifications", systemImage: CUPSystemIcon.delete)
                    }
                } label: {
                    Image(systemName: CUPSystemIcon.moreMenu)
                        .symbolVariant(.circle)
                }
            }
        }
    }
}

struct NotificationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsScreen()
    }
}
