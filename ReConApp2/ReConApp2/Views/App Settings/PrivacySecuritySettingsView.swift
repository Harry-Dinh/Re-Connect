//
//  PrivacySecuritySettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-04-23.
//

import SwiftUI

struct PrivacySecuritySettingsView: View {
    
    @AppStorage("biometricEnabled") var biometricEnabled = false
    
    var body: some View {
        Form {
            Section(footer: Text("Use Touch ID or Face ID for editing your Re:Connect profile and locking the app.")) {
                Toggle(isOn: $biometricEnabled) {
                    Text("Use Touch ID/Face ID")
                }
            }
            
            Section(footer: Text("Re:Connect put your privacy at the forefront of everything we do. If you would like to help us improve our services, you can choose to send your usage information. This information will not include your personal information and it will not be sold to advertisers.")) {
                Toggle(isOn: .constant(true)) {
                    Text("Diagnostic info collection")
                }
            }
        }
        .navigationTitle("Privacy & Security")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PrivacySecuritySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PrivacySecuritySettingsView()
        }
    }
}
