//
//  DeveloperSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct DeveloperSettingsScreen: View {
    
    @State private var showColor = false
    @ObservedObject private var editprofileVM = EditProfileScreenVM.viewModel
    
    var body: some View {
        List {
            Button("Print pfp url") {
                print("URL: \(LoginScreenVM.viewModel.loggedInUser?.pfpURL ?? "No URL")")
            }
        }
        .navigationTitle("Developer")
    }
}

struct DeveloperSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DeveloperSettingsScreen()
    }
}
