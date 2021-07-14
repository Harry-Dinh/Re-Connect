//
//  AccountSettings.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-13.
//

import SwiftUI

struct AccountSettings: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Form {
            Button("Sign Out") {
                LoginVM.shared.signOutUser()
            }
            .foregroundColor(.red)
            
            Button("Erase All Data of Current User") {
                LoginVM.shared.deleteCurrentUserData()
            }
            .foregroundColor(.red)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left.circle")
                })
                
                Text("My Account")
                    .font(.title3)
                    .bold()
            }
        }
    }
}

struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AccountSettings()
        }
    }
}
