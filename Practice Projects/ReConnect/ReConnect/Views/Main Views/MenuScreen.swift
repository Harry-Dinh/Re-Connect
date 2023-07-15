//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct MenuScreen: View {
    
    @ObservedObject var viewModel = MenuScreenVM.viewModel
    @ObservedObject var loginVM = LoginScreenVM.viewModel
    
    var body: some View {
        NavigationView {
            List {
                ProfileListRowView(user: loginVM.loggedInUser ?? RECUser.placeholderUser)
                
                Section {
                    ForEach(viewModel.contentSectionItems) { content in
                        RECMenuListRow(rowItem: content)
                    }
                }
                
                Section {
                    NavigationLink(destination: AppSettingsScreen.init) {
                        RECMenuListRow(rowItem: viewModel.applicationSectionItems[0])
                    }
                }
            }
            .background(
                RECBackgroundTheme(showBottomColor: false)
            )
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.newFolder)
                    }
                }
            }
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
