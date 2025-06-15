//
//  AppSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct AppSettingsScreen: View {
    
    @ObservedObject var viewModel = AppSettingsVM.instance
    
    var body: some View {
        List {
            Section {
                NavigationLink(destination: AccountSettingsScreen()) {
                    Label("Re:Connect Account", systemImage: CUPSystemIcon.profile)
                }
            }
            
            Section {
                NavigationLink(destination: GeneralSettingsScreen()) {
                    Label("General", systemImage: CUPSystemIcon.settings)
                }
                
                NavigationLink(destination: NotificationSettings()) {
                    Label("Notifications", systemImage: CUPSystemIcon.notification)
                }
                
                NavigationLink(destination: EmptyView()) {
                    Label("Privacy & Security", systemImage: CUPSystemIcon.privacySecurityIcon)
                }
            }
            
            Section {
                NavigationLink(destination: DeveloperSettingsScreen.init) {
                    Label("Developer", systemImage: CUPSystemIcon.hammer)
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AppSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppSettingsScreen()
        }
    }
}
