//
//  DeveloperSettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-27.
//

import SwiftUI

struct DeveloperSettingsView: View {
    
    private var firstName = ProfileVM.shared.readUserFromDefaults()?.firstName ?? "First"
    private var lastName = ProfileVM.shared.readUserFromDefaults()?.lastName ?? "Last"
    
    var body: some View {
        List {
            Section(footer: Text("Current user from UserDefaults test")) {
                Text("\(firstName) \(lastName)")
                Text(ProfileVM.shared.readUserFromDefaults()?.firebaseUID ?? "No Firebase ID")
            }
        }
        .navigationTitle("Developer")
    }
}

struct DeveloperSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSettingsView()
    }
}
