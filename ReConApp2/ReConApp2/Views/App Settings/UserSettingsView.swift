//
//  UserSettingsView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-17.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserSettingsView: View {
    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .padding(7)
                        .foregroundColor(.accentColor)
                        .font(.system(size: 30))
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.accentColor.opacity(0.25)))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(ProfileVM.shared.user.fullName)
                            .bold()
                            .font(.title3)
                        
                        Text(AuthVM.getUID() ?? "No UID")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .textSelection(.enabled)
                    }
                }
                .padding(.vertical, 7)
                
                HStack {
                    Text("Email")
                    Spacer()
                    Text(ProfileVM.shared.user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            
            Section {
                Button(action: {}) {
                    Label("Contact Support", systemImage: "phone")
                }
            }
            
            Section(header: Text("Account Options")) {
                Button(action: {
                    AuthVM.signOut()
                }) {
                    Label("Sign Out", systemImage: "rectangle.portrait.and.arrow.right")
                }
                
                Button(action: {}) {
                    Label("Change Email or Password...", systemImage: "rectangle.and.pencil.and.ellipsis")
                }
            }
            
            Section(footer: Text("Deactivating your account will not delete your data. Your account will be archived until you reactivate it again. To delete your account and all of its data permanantly, choose \"Delete Account\" below.")) {
                Button(role: .destructive, action: {}) {
                    HStack {
                        Spacer()
                        Text("Deactivate Account")
                        Spacer()
                    }
                }
            }
            
            Button(role: .destructive, action: {}) {
                HStack {
                    Spacer()
                    Text("Delete Account")
                    Spacer()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Account")
    }
}

struct UserSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        UserSettingsView()
    }
}
