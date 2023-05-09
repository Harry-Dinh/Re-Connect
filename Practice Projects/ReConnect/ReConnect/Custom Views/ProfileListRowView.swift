//
//  ProfileListRowView.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct ProfileListRowView: View {
    
    var user: RECUser
    
    var body: some View {
        HStack {
            if user.pfpURL == nil {
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 50))
                    .foregroundColor(.accentColor)
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
