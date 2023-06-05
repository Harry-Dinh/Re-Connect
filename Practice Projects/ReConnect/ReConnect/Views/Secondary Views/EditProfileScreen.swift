//
//  EditProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI
import PhotosUI

struct EditProfileScreen: View {
    
    @ObservedObject private var viewModel = EditProfileScreenVM.viewModel
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedView == 0 {
                    List {
                        Section {
                            HStack {
                                Spacer()
                                if loginVM.loggedInUser?.pfpURL == nil || loginVM.loggedInUser?.pfpURL == "" {
                                    Image(systemName: CUPSystemIcon.profile)
                                        .resizable()
                                        .symbolVariant(.fill)
                                        .foregroundColor(.secondary)
                                        .frame(width: 100, height: 100)
                                } else {
//                                    viewModel.displayImage?
//                                        .resizable()
//                                        .foregroundColor(.secondary)
//                                        .frame(width: 100, height: 100)
                                }
                                Spacer()
                            }
                        } header: {
                            Text("Profile Picture")
                        }
                        .listRowBackground(Color.clear)
                        
                        Button(action: {}) {
                            Label("Take Photo", systemImage: CUPSystemIcon.camera)
                        }
                        
                        Button(action: {
                            viewModel.presentImagePicker.toggle()
                        }) {
                            Label("Choose Photo", systemImage: CUPSystemIcon.photo)
                        }
                        
                        Section {
                            RECGradientBackground(colorSet: [viewModel.startingColor, viewModel.endingColor],
                                                         userInfo: viewModel.tempUser,
                                                         infoVisible: true)
                            .listRowSeparator(.hidden)
                            
                            ColorPicker(selection: $viewModel.startingColor, supportsOpacity: false) {
                                Text("Starting Color")
                            }
                            
                            ColorPicker(selection: $viewModel.endingColor, supportsOpacity: false) {
                                Text("Ending Color")
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
                        Text("Account").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 190)
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss.callAsFunction()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.writeCustomizationDataToDatabase(with: viewModel.tempUser.getFirebaseUID())
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
