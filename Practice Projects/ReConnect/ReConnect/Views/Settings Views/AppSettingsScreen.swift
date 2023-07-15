//
//  AppSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-23.
//

import SwiftUI

struct AppSettingsScreen: View {
    
    @ObservedObject var viewModel = AppSettingsVM.viewModel
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.accountSettingsSection) { content in
                    NavigationLink(destination: AccountSettingsScreen.init) {
                        Label(content.label, systemImage: CUPSystemIcon.settings)
                    }
                }
            }
            
            Section {
                NavigationLink(destination: GeneralSettingsScreen()) {
                    Label("General", systemImage: CUPSystemIcon.settings)
                }
            }
            
            Section {
                NavigationLink(destination: DeveloperSettingsScreen.init) {
                    Text("Developer")
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
