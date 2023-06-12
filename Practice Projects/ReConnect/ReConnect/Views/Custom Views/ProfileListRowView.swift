//
//  ProfileListRowView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileListRowView: View {
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    var user: RECUser
    
    var body: some View {
        HStack {
            if user.pfpURL == nil || user.pfpURL == "" {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.accentColor)
            } else {
                WebImage(url: URL(string: (loginVM.loggedInUser?.pfpURL)!))
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(user.displayName)
                    .font(.title2)
                
                Text(user.username)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct ProfileListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListRowView(user: RECUser.placeholderUser)
    }
}
