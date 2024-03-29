//
//  FollowerScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-16.
//

import SwiftUI

struct FollowerScreen: View {
    
    @ObservedObject var userInfo: RECUserWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(userInfo.user.followers, id: \.firebaseUID) { user in
                    Text(user.firebaseUID)
                }
            }
            .navigationTitle("Followers")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.filter)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss.callAsFunction()
                    }
                }
            }
            .searchable(text: .constant(""), placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search"))
        }
    }
}

struct FollowerScreen_Previews: PreviewProvider {
    static var previews: some View {
        FollowerScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
