//
//  EditProfile.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-24.
//

import SwiftUI
import Firebase

struct EditProfile: View {
    
    @ObservedObject var viewModel = ProfileVM.shared
    @Environment(\.presentationMode) var presentationMode
    
    private var databaseRef = Database.database().reference()
    
    var body: some View {
        Form {
            HStack {
                Image(uiImage: viewModel.profilePic)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(15)
                
                Button("Change profile picture") {
                    viewModel.showPhotoPickerActionSheet.toggle()
                }
                .actionSheet(isPresented: $viewModel.showPhotoPickerActionSheet, content: {
                    ActionSheet(title: Text("Choose where to select your profile picture"), message: nil, buttons: [
                        .cancel(),
                        .default(Text("Take Photo"), action: {
                            viewModel.showCameraInterface.toggle()
                        }),
                        .default(Text("Choose from Library"), action: {
                            viewModel.showImagePicker.toggle()
                        })
                    ])
                })
                .sheet(isPresented: $viewModel.showCameraInterface, content: {
                    ImagePicker(selectedImage: $viewModel.profilePic, sourceType: .camera)
                })
                .sheet(isPresented: $viewModel.showImagePicker, content: {
                    ImagePicker(selectedImage: $viewModel.profilePic, sourceType: .photoLibrary)
                })
            }
            .padding(.vertical)
            
            Section {
                Toggle(isOn: $viewModel.isPrivateAccount, label: {
                    if viewModel.isPrivateAccount {
                        Label("Use Private Account", systemImage: "lock.fill")
                    }
                    else {
                        Label("Use Private Account", systemImage: "lock.open.fill")
                    }
                })
            }
            
            Section(header: Text("Basic Info")) {
                TextField("First name", text: $viewModel.firstName, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
                
                TextField("Middle name (optional)", text: $viewModel.middleName, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
                
                TextField("Last name", text: $viewModel.lastName, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
                
                TextField("Username (e.g: @JimKirk1701)", text: $viewModel.username, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !viewModel.isTextFieldEditing {
                    Button("Save") {
                        updateUserInfo()
                        viewModel.uploadProfilePicData()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                else {
                    Button("Done") {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        viewModel.isTextFieldEditing = false
                    }
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func updateUserInfo() {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        let updatedProfileValues: [String: Any] = [
            "isPrivateAccount": viewModel.isPrivateAccount,
            "username": viewModel.username
        ]
        
        let updatedBasicValues: [String: Any] = [
            "firstName": viewModel.firstName,
            "middleName": viewModel.middleName,
            "lastName": viewModel.lastName
        ]
        
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").updateChildValues(updatedProfileValues)
        
        databaseRef.child("Users").child("\(safeEmail)_\(uid)").updateChildValues(updatedBasicValues)
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfile()
        }
    }
}
