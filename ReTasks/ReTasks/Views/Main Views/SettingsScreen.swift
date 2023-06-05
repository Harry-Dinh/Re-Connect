//
//  SettingsScreen.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-05.
//

import SwiftUI

struct SettingsScreen: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    if !loginVM.hasAccount {
                        Button("Sign in or create a Re:Tasks account") {}
                    }
                } header: {
                    Text("Re:Tasks Account")
                } footer: {
                    if !loginVM.hasAccount {
                        Text("A Re:Tasks account is used for syncing your to-dos and projects across all of your devices.")
                    }
                }
            }
            .navigationTitle("Re:Tasks Settings")
            .navigationBarTitleDisplayMode(.inline)
            .interactiveDismissDisabled()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss.callAsFunction()
                    }
                }
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
