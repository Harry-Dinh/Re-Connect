//
//  EditProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

struct EditProfileScreen: View {
    
    @ObservedObject private var viewModel = EditProfileScreenVM.viewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedView == 0 {
                    List {
                        Section {
                            RECEditProfilePFPHeader(pfpURL: viewModel.tempUser.pfpURL)
                                .padding(.vertical, 7)
                        } header: {
                            Text("Profile Picture")
                        }
                        .listRowBackground(Color.clear)
                        
                        Menu {
                            Button(action: {}) {
                                Label("Take Photo", systemImage: CUPSystemIcon.camera)
                            }
                            
                            Button(action: {}) {
                                Label("Choose Photo", systemImage: CUPSystemIcon.photo)
                            }
                        } label: {
                            Text("Select New Profile Picture")
                        }
                        
                        Section {
                            RECGradientBackgroundPreview(colorSet: [viewModel.startingColor, viewModel.endingColor],
                                                         userInfo: viewModel.tempUser)
                            ColorPicker(selection: $viewModel.startingColor, supportsOpacity: false) {
                                Text("Starting Color")
                            }
                            
                            ColorPicker(selection: $viewModel.endingColor, supportsOpacity: false) {
                                Text("EndingColor")
                            }
                            
                        } header: {
                            Text("Background Gradient")
                        }
                    }
                    .listStyle(.insetGrouped)
                } else {
                    Form {
                        Section {
                            TextField("Email address", text: $viewModel.tempEmailAddress)
                        } header: {
                            Text("Edit your email address")
                        }
                    }
                    .headerProminence(.increased)
                    .onAppear { viewModel.tempEmailAddress = viewModel.tempUser.emailAddress }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker("", selection: $viewModel.selectedView) {
                        Text("Profile").tag(0)
                        Text("Email").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 170)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss.callAsFunction()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss.callAsFunction()
                    }) {
                        Text("Save")
                            .fontWeight(.semibold)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileScreen()
    }
}
