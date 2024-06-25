//
//  FollowingScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-16.
//

import SwiftUI

struct FollowingScreen: View {
    
    @ObservedObject var userInfo: RECUserWrapper
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm = FollowScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.localFollowings, id: \.firebaseUID) { user in
                    NavigationLink(destination: OtherUserProfileScreen(userInfo: RECUserWrapper(user))) {
                        RECSearchResultUserRow(user: RECUserWrapper(user))
                    }
                }
            }
            .navigationTitle("Following")
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
                if !vm.refreshFollowings {
                    vm.fetchFollowings()
                    vm.refreshFollowings = true
                }
            }
            .refreshable {
                vm.fetchFollowings()
            }
        }
    }
}

struct FollowingScreen_Previews: PreviewProvider {
    static var previews: some View {
        FollowingScreen(userInfo: RECUserWrapper(RECUser.placeholderUser))
    }
}
