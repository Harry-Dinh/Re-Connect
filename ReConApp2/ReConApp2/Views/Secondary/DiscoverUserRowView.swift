//
//  DiscoverUserRowView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-16.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverUserRowView: View {
    
    var user: ReConUser
    
    var body: some View {
        HStack {
            if !user.profilePicURL!.isEmpty {
                WebImage(url: URL(string: user.profilePicURL!))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 45, height: 45)
            }
            else {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .foregroundColor(.secondary)
                    .clipShape(Circle())
                    .frame(width: 45, height: 45)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(user.firstName) \(user.lastName)")
                    .font(.headline)
                
                Text(user.username)
                    .font(.subheadline)
                
                if !user.bio.isEmpty {
                    Text(user.bio)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
        }
        .padding(.vertical, 7)
    }
}

struct DiscoverUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverUserRowView(user: ReConUser())
    }
}
