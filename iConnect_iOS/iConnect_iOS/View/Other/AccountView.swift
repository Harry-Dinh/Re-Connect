//
//  AccountView.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-05.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        List {
            Button(action: {
                LoginVM.shared.signOutUser()
                DatabaseManager.shared.clearCachedDataFromUserDefaults()
                
                withAnimation {
                    LoginVM.shared.isSignedIn = false
                }
            }, label: {
                Text("Sign Out")
            })
            
            Button(action: {
                LoginVM.shared.deleteUser()
            }, label: {
                Text("Sign Out and Delete Account")
                    .foregroundColor(.red)
            })
        }
        .listStyle(GroupedListStyle())
        .navigationTitle("My Account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
