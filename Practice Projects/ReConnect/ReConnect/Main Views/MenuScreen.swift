//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct MenuScreen: View {
    
    private let contentSectionItems: [RECListRowItem] = [
        RECListRowItem(label: "Followers", iconStr: "person.2", tintColor: .accentColor),
        RECListRowItem(label: "Following", iconStr: "person.3", tintColor: .accentColor),
        RECListRowItem(label: "Bookmarks", iconStr: "book.closed", tintColor: .orange)
    ]
    
    var body: some View {
        NavigationView {
            List {
                ProfileListRowView(user: RECUser.placeholderUser)
                
                Section {
                    ForEach(contentSectionItems) { content in
                        HStack {
                            Label {
                                Text(content.label)
                            } icon: {
                                Image(systemName: content.iconStr ?? "gear")
                                    .foregroundColor(content.tintColor)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
