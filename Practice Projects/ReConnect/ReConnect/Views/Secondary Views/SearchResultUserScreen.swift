//
//  SearchResultUserScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-16.
//

import SwiftUI

struct SearchResultUserScreen: View {
    
    var user: RECUser
    
    var body: some View {
        List {
            Section {
                RECDisplayLabel(label: "Display name", value: user.displayName)
                RECDisplayLabel(label: "Username", value: user.username)
            } header: {
                Text("Profile Info")
            }
            
            Section {
                RECDisplayLabel(valueDisplayMode: .small, label: "Email address", value: user.emailAddress)
                RECDisplayLabel(label: "Age", value: "\(user.age)")
            } header: {
                Text("Account Info")
            }
            
            Section {
                Text(user.getUID())
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            } header: {
                Text("RE:Connect Unique Identifier")
            }
            
            Section {
                Text(user.getFirebaseUID())
                    .foregroundColor(.secondary)
                    .font(.subheadline)
            } header: {
                Text("Firebase Unique Identifier")
            }
        }
        .navigationTitle(user.displayName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchResultUserScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SearchResultUserScreen(user: RECUser.placeholderUser)
        }
    }
}
