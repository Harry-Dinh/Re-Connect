//
//  DetailedRegistrationScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-12.
//

import SwiftUI

struct DetailedRegistrationScreen: View {
    
    @ObservedObject var viewModel = DetailedRegistrationVM.viewModel
    
    var body: some View {
        List {
            RECListHeader(icon: CUPSystemIcon.infoCircle,
                          label: "Finish Setting Up Your Account",
                          isListHeader: true)
                .listRowBackground(Color.clear)
            
            Text("Just a few more preferences to select and you can start using your new Re:Connect account.")
                .foregroundColor(.secondary)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            
            Section {
                TextField("Age", text: $viewModel.ageField)
                    .keyboardType(.numberPad)
                
                TextField("Username (i.e. @JimKirk1701)", text: $viewModel.usernameField)
                
                Toggle(isOn: $viewModel.protectedAccountToggle) {
                    Text("Use Private Account")
                }
            }
            
            Button(action: {
                viewModel.updateFinalUserInfo(ageStr: viewModel.ageField,
                                              username: viewModel.usernameField,
                                              isProtectedAccount: viewModel.protectedAccountToggle)
            }) {
                RECListButtonLabel(title: "Create Re:Connect Account", style: .backgroundProminant)
            }
            .listRowBackground(Color.accentColor)
        }
        .alert("Failed to convert age to integer", isPresented: $viewModel.failedToConvertAgeStr) {
            Button(role: .cancel, action: {}) {
                Text("Dismiss")
            }
        }
        .alert("Failed to write data to database", isPresented: $viewModel.failedToWriteToDatabase) {
            Button(role: .cancel, action: {}) {
                Text("Dismiss")
            }
        }
    }
}

struct DetailedRegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailedRegistrationScreen()
        }
    }
}
