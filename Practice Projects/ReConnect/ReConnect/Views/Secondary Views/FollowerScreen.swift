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
    @ObservedObject var vm = FollowScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.localFollowers, id: \.firebaseUID) { user in
                    NavigationLink(destination: OtherUserProfileScreen(userInfo: RECUserWrapper(user))) {
                        RECSearchResultUserRow(user: RECUserWrapper(user))
                    }
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
            .onAppear {
                if !vm.refreshFollowers {
                    vm.fetchFollowers()
                    vm.refreshFollowers = true
                }
            }
            .refreshable {
                vm.fetchFollowers()
            }
        }
    }
}

struct FollowerScreen_Previews: PreviewProvider {
    static var previews: some View {
        FollowerScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
