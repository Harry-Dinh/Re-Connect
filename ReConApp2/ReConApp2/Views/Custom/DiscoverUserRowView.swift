//
//  DiscoverUserRowView.swift
//  ReConApp2
//
//  Created by Harry Dinh on 2022-03-16.
//

import SwiftUI
import SDWebImageSwiftUI

struct DiscoverUserRowView: View {
    
    var firstName: String
    var lastName: String
    var pfpURLStr: String
    var bio: String
    
    var body: some View {
        HStack {
            if !pfpURLStr.isEmpty {
                WebImage(url: URL(string: pfpURLStr))
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
                Text("\(firstName) \(lastName)")
                Text(bio)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 7)
    }
}

struct DiscoverUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverUserRowView(firstName: "Harry", lastName: "Dinh", pfpURLStr: "https://cdn.vox-cdn.com/thumbor/o53k-QbKFns_s-OP89E8o34Ho8U=/0x0:599x500/1200x800/filters:focal(286x259:380x353)/cdn.vox-cdn.com/uploads/chorus_image/image/69634799/download__5_.0.jpg", bio: "Re:Connect")
    }
}
