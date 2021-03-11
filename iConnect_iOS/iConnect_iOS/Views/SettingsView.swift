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
    
    var body: some View {
        VStack {
            Button("Sign Out") {
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
            }
            
            Button("Write to Database") {
                DatabaseManager.shared.test()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
