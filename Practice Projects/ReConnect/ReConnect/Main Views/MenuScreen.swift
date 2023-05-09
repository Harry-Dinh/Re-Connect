//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct MenuScreen: View {
    
    @ObservedObject var viewModel = MenuScreenVM.viewModel
    
    var body: some View {
        NavigationView {
            List {
                ProfileListRowView(user: RECUser.placeholderUser)
                
                Section {
                    ForEach(viewModel.contentSectionItems) { content in
                        RECMenuListRow(rowItem: content)
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
