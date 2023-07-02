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
            Button("Print Profile Customizations") {
                let colors = editprofileVM.returnProfileCustomizationData(from: "IX1xmsPXEvdpvd1EnCm7ECJ4S3m2")
                print(colors.description)
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
