//
//  Settings.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI
import Firebase

struct SettingsView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    @State private var showSignOutAlert = false
    @StateObject var settingsVM = SettingsVM()
    
    var body: some View {
        NavigationView {
            Form {
                Button("Sign Out") {
                    self.showSignOutAlert.toggle()
                }
                .alert(isPresented: $showSignOutAlert) {
                    Alert(title: Text(settingsVM.alertTitle), message: Text(settingsVM.alertMessage), primaryButton: .cancel(Text(settingsVM.alertDismissAction)), secondaryButton: .default(Text(settingsVM.alertPrimaryAction), action: {
                        withAnimation {
                            do {
                                try Auth.auth().signOut()
                                isSignedIn = false
                                print("Successfully signed out")
                            }
                            catch {
                                print("Failed to sign out: \(error.localizedDescription)")
                            }
                        }
                    }))
                }
                
                Button("Write to Database") {
                    DatabaseManager.shared.test()
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
