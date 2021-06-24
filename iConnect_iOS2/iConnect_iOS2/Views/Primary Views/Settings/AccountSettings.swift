//
//  AccountSettings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-13.
//

import SwiftUI

struct AccountSettings: View {
    var body: some View {
        Form {
            Button("Sign Out") {
                LoginVM.shared.signOutUser()
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
