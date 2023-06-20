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
    @ObservedObject private var registerVM = RegisterScreenVM.viewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedView == 0 {
                    List {
                        Section {
                            HStack(spacing: 12) {
                                if let previewImage = viewModel.previewImage {
                                    previewImage
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())
                                } else {
                                    Image(systemName: CUPSystemIcon.profile)
                                        .resizable()
                                        .symbolVariant(.fill)
                                        .foregroundColor(.secondary)
                                        .frame(width: 70, height: 70)
                                }
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    TextField("Display name", text: $viewModel.tempUser.displayName)
                                        .font(.title2)
                                        .bold()
                                    TextField("Username", text: $viewModel.tempUser.username)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .keyboardType(.emailAddress)
                                }
                            }
                            .listRowSeparator(.hidden)
                            
                            Button(action: {}) {
                                Label("Take Photo", systemImage: CUPSystemIcon.camera)
                            }
                            
                            PhotosPicker(selection: $viewModel.selectedImages, maxSelectionCount: 1, matching: .images) {
                                Label("Choose Photo", systemImage: CUPSystemIcon.photo)
                            }
                            .onChange(of: viewModel.selectedImages) { _ in
                                Task {
                                    if let data = try? await viewModel.selectedImages.first?.loadTransferable(type: Data.self) {
                                        if let uiImage = UIImage(data: data) {
                                            viewModel.previewImage = Image(uiImage: uiImage)
                                            viewModel.imageData = data
                                            return
                                        }
                                    }
                                    print("Failed")
                                }
                            }
                        } footer: {
                            Text("Tap on your name and username to edit them.")
                        }
                        
                        Section {
                            RECProfileGradientPreview(colorSet: [viewModel.startingColor, viewModel.endingColor],
                                                         userInfo: viewModel.tempUser,
                                                         infoVisible: false)
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
                        Section("Update your email address") {
                            TextField("Email address", text: $viewModel.tempUser.emailAddress)
                                .padding(.vertical, 8)
                                .keyboardType(.emailAddress)
                        }
                        
                        Section("Change your account security") {
                            Toggle(isOn: $viewModel.tempUser.isProtectedAccount) {
                                if viewModel.tempUser.isProtectedAccount {
                                    Label("Use Private Account", systemImage: CUPSystemIcon.passwordLock)
                                } else {
                                    Label("Use Private Account", systemImage: CUPSystemIcon.passwordLockUnlocked)
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    .headerProminence(.increased)
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
                        viewModel.tempUser = RECUser.placeholderUser
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.writeCustomizationDataToDatabase(with: viewModel.tempUser.getFirebaseUID())
                        registerVM.writeUpdatedUserInfo(with: viewModel.tempUser)
                        loginVM.loggedInUser = viewModel.tempUser
                        loginVM.cacheLoggedInUser()
                        loginVM.readLoggedInUser()
                        dismiss.callAsFunction()
                        viewModel.tempUser = RECUser.placeholderUser
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
