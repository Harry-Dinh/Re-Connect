//
//  RECSearchResultUserRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-14.
//

import SwiftUI

struct RECSearchResultUserRow: View {
    
    var user: RECUser
    
    var body: some View {
        HStack {
            if user.pfpURL?.isEmpty ?? ((RECUser.placeholderUser.pfpURL?.isEmpty) != nil) || user.pfpURL == nil {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.accentColor)
            } else {
                if let data = try? Data(contentsOf: URL(string: user.pfpURL!)!) {
                    if let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(user.displayName)
                    .font(.headline)
                Text(user.username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RECSearchResultUserRow_Previews: PreviewProvider {
    static var previews: some View {
        RECSearchResultUserRow(user: RECUser.placeholderUser)
    }
}
