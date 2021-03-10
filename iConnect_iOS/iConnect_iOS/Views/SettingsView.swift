//
//  Settings.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-09.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("is_signed_in") var isSignedIn = false
    
    var body: some View {
        Button("Sign Out") { withAnimation { isSignedIn = false } }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
