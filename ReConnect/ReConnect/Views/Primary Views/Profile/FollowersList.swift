//
//  FollowersList.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-08-21.
//

import SwiftUI

struct FollowersList: View {
    var body: some View {
        Form {
            VStack(alignment: .leading) {
                HStack(spacing: 7) {
                    Image(systemName: "info.circle")
                    Text("Followers List")
                }
                .font(.headline)
                
                Text("This list shows you all of the people you have followed on Re:Connect.")
            }
            
            Section {
                DiscoverListRow(fullName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: true)
                DiscoverListRow(fullName: "Jeni Takahashi", username: "@Jeni_WOOMY", isPrivateAccount: true)
                DiscoverListRow(fullName: "Tamav", username: "@Tamav_🖖🏻", isPrivateAccount: false)
                DiscoverListRow(fullName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: true)
                DiscoverListRow(fullName: "Jeni Takahashi", username: "@Jeni_WOOMY", isPrivateAccount: true)
                DiscoverListRow(fullName: "Tamav", username: "@Tamav_🖖🏻", isPrivateAccount: false)
                DiscoverListRow(fullName: "Harry Dinh", username: "@HarryTDA16", isPrivateAccount: true)
                DiscoverListRow(fullName: "Jeni Takahashi", username: "@Jeni_WOOMY", isPrivateAccount: true)
                DiscoverListRow(fullName: "Tamav", username: "@Tamav_🖖🏻", isPrivateAccount: false)
            }
        }
        .navigationTitle("Followers")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FollowersList_Previews: PreviewProvider {
    static var previews: some View {
        FollowersList()
    }
}
