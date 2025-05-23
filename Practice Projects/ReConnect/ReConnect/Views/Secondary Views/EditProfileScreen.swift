//
//  EditProfileScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI
import PhotosUI

struct EditProfileScreen: View {
    
    @ObservedObject private var viewModel = EditProfileScreenVM.instance
    @ObservedObject private var loginVM = LoginScreenVM.instance
    @ObservedObject private var registerVM = RegisterScreenVM.instance
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.selectedView == 0 {
                    // MARK: - EDIT PROFILE VIEW
                    List {
                        // MARK: Display Info
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
//                                        .onChange(of: viewModel.tempUser.displayName) { newValue in
//                                            // Prevent the display name from exceeding 50 characters
//                                            if newValue.count > viewModel.DISPLAY_NAME_MAX {
//                                                viewModel.tempUser.displayName = String(newValue.prefix(viewModel.DISPLAY_NAME_MAX))
//                                            }
//                                        }
                                    
                                    TextField("Username", text: $viewModel.tempUser.username)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .keyboardType(.emailAddress)
//                                        .onChange(of: viewModel.tempUser.username) { newValue in
//                                            // Making sure the username has the minimum of 4 characters and has to be less than 15 characters with and has an "@"
//                                            if !(newValue.count >= viewModel.USERNAME_MIN && newValue.count <= viewModel.USERNAME_MAX) {
//
//                                            }
//                                        }
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
                        
                        // MARK: Background Gradient
                        Section {
                            RECProfileGradientPreview(colorSet: [viewModel.startingColor, viewModel.endingColor])
                            .listRowSeparator(.hidden)
                            
                            ColorPicker(selection: $viewModel.startingColor, supportsOpacity: false) {
                                Text("Left Color")
                            }
                            
                            ColorPicker(selection: $viewModel.endingColor, supportsOpacity: false) {
                                Text("Right Color")
                            }
                            
                        } header: {
                            Text("Background Gradient")
                        }
                    }
                    .listStyle(.insetGrouped)
                    
                    // MARK: - EDIT ACCOUNT VIEW
                } else {
                    // MARK: Update Email Address
                    Form {
                        Section("Update your email address") {
                            TextField("Email address", text: $viewModel.tempUser.emailAddress)
                                .keyboardType(.emailAddress)
                        }
                        
                        // MARK: Account Security
                        Section {
                            Toggle(isOn: $viewModel.tempUser.isProtectedAccount) {
                                if viewModel.tempUser.isProtectedAccount {
                                    Label("Use Protected Account", systemImage: CUPSystemIcon.passwordLock)
                                } else {
                                    Label("Use Protected Account", systemImage: CUPSystemIcon.passwordLockUnlocked)
                                }
                            }
                        } header: {
                            Text("Account Security")
                        } footer: {
                            Text("When using a protected account, other users must get your approval before following you on Re:Connect. Otherwise, they can follow you immediately.")
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
                        loginVM.currentUser = viewModel.tempUser
                        loginVM.cacheLoggedInUser()
                        loginVM.readLoggedInUser()
                        viewModel.fetchProfileCustomizationData(from: viewModel.tempUser.getFirebaseUID())
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
