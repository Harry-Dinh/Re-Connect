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
    private var firestoreRef = Firestore.firestore()
    
    var body: some View {
        Form {
            Section(header: Text("Basic Info")) {
                TextField("Display name", text: $viewModel.fullName, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
                
                TextField("Username (e.g: @JimKirk1701)", text: $viewModel.username, onEditingChanged: { isEditing in
                    viewModel.isTextFieldEditing = isEditing
                })
            }
            
            Section(header: Text("Profile Picture")) {
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
                
                Button(action: {
                    viewModel.uploadProfilePicData()
                }, label: {
                    Label("Save profile picture", systemImage: "photo")
                })
                
                Button(action: {
                    
                }, label: {
                    Label("Continue without profile picture", systemImage: "trash")
                        .foregroundColor(.red)
                })
            }
            
            Section(header: Text("Account Settings")) {
                Toggle(isOn: $viewModel.isPrivateAccount, label: {
                    if viewModel.isPrivateAccount {
                        Label("Use Private Account", systemImage: "lock")
                    }
                    else {
                        Label("Use Private Account", systemImage: "lock.open")
                    }
                })
                
                Toggle(isOn: $viewModel.diagnosticPreferences, label: {
                    Label("Diagnostic Preferences", systemImage: "gear")
                })
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if !viewModel.isTextFieldEditing {
                    Button("Save Info") {
                        updateUserInfo()
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
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let updatedProfileValues: [String: Any] = [
            "isPrivateAccount": viewModel.isPrivateAccount,
            "username": viewModel.username,
            "fullName": viewModel.fullName,
            "diagnosticPreferences": viewModel.diagnosticPreferences
        ]
        
        // Update data on Database
        databaseRef.child("Users").child("\(uid)").updateChildValues(updatedProfileValues)
        
        // Update data on Firestore
        let path = firestoreRef.collection("users")
        path.whereField("uid", isEqualTo: uid).getDocuments { snapshot, error in
            if let error = error {
                // Some error happened
                print(error)
            }
            else if snapshot?.documents.count != 1 {
                // Success but could have things be error
            }
            else {
                let updatedValues: [String: Any] = [
                    "isPrivateAccount": viewModel.isPrivateAccount,
                    "username": viewModel.username,
                    "fullName": viewModel.fullName
                ]
                
                let doc = snapshot?.documents.first
                doc?.reference.updateData(updatedValues)
            }
        }
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfile()
        }
        
    }
}
