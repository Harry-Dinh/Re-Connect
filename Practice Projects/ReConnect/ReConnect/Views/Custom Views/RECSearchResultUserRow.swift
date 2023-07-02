//
//  RECSearchResultUserRow.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-14.
//

import SwiftUI

struct RECSearchResultUserRow: View {
    
    @ObservedObject var user: RECUserWrapper
    
    var body: some View {
        HStack {
            if user.user.pfpURL?.isEmpty ?? ((RECUser.placeholderUser.pfpURL?.isEmpty) != nil) || user.user.pfpURL == nil {
                Image(systemName: CUPSystemIcon.profile)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.accentColor)
            } else {
                if let pfpURL = self.user.user.pfpURL,
                   let url = URL(string: pfpURL) {
                    AsyncImage(url: url, content: { image in
                        image.resizable()
                    }, placeholder: {
                        ProgressView()
                    })
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(user.user.displayName)
                    .font(.headline)
                Text(user.user.username)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct RECSearchResultUserRow_Previews: PreviewProvider {
    static var previews: some View {
        RECSearchResultUserRow(user: RECUserWrapper(RECUser.placeholderUser))
    }
}
