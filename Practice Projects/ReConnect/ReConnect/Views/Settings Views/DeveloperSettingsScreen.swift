//
//  DeveloperSettingsScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct DeveloperSettingsScreen: View {
    var body: some View {
        List {
            Button("Test RGB color function") {
                let sampleColor = EditProfileScreenVM.viewModel.startingColor
                let components = EditProfileScreenVM.viewModel.getRGBComponents(from: sampleColor)
                print(components ?? "No components")
            }
            
            Button("Test writing color to database") {
                EditProfileScreenVM.viewModel.startingColor = .red
                EditProfileScreenVM.viewModel.endingColor = .blue
                
                EditProfileScreenVM.viewModel.writeCustomizationDataToDatabase(with: RECUser.placeholderUser.getFirebaseUID())
            }
            
            Button("Fetch color test") {
                let sampleColor = EditProfileScreenVM.viewModel.startingColor
                let convertedValues = EditProfileScreenVM.viewModel.getRGBComponents(from: sampleColor)
                print(convertedValues ?? "No components")
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
