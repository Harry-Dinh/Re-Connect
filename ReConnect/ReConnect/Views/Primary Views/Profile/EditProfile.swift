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
            Toggle(isOn: $viewModel.isPrivateAccount, label: {
                Text("Use Private Account")
            })
            
            Section {
                TextField("Change username (e.g: @JimKirk1701)", text: $viewModel.username)
            }
        }
        .navigationTitle("Edit Profile")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    updateUserInfo()
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
    
    private func updateUserInfo() {
        guard let email = Auth.auth().currentUser?.email,
              let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let safeEmail = HelperMethods.shared.convertToSafeEmail(email: email)
        
        let updatedValues: [String: Any] = [
            "isPrivateAccount": viewModel.isPrivateAccount,
            "username": viewModel.username
        ]
        
        databaseRef.child("Users").child("User \(safeEmail)_\(uid)").child("Profile Info").updateChildValues(updatedValues)
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
