//
//  RECProfileHeader.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-27.
//

import SwiftUI

struct RECProfileHeader: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        HStack(spacing: 10) {
            
            if loginVM.loggedInUser?.pfpURL == nil || loginVM.loggedInUser?.pfpURL == "" {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.accentColor)
            } else {
                // Load image here...
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(loginVM.loggedInUser?.displayName ?? RECUser.placeholderUser.displayName)
                    .font(.title)
                
                if loginVM.loggedInUser?.isProtectedAccount ?? RECUser.placeholderUser.isProtectedAccount {
                    Label(loginVM.loggedInUser?.username ?? RECUser.placeholderUser.username,
                          systemImage: "lock.fill")
                    .foregroundColor(.secondary)
                } else {
                    Text(loginVM.loggedInUser?.username ?? RECUser.placeholderUser.username)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.bottom)
    }
}

struct RECProfileHeader_Previews: PreviewProvider {
    static var previews: some View {
        RECProfileHeader()
    }
}
