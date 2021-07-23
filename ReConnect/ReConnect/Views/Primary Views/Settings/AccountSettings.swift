//
//  AccountSettings.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-23.
//

import SwiftUI

struct AccountSettings: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Button("Sign Out") {
                LoginVM.shared.signOutCurrentUser()
            }
            .foregroundColor(.red)
            
            Button("Erase all logged in user's data and sign out") {
                // Erase everything method here...
            }
            .foregroundColor(.red)
        }
        .navigationTitle("My Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountSettings()
        }
    }
}
