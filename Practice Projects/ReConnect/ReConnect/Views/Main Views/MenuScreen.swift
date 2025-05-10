//
//  MenuScreen.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-08.
//

import SwiftUI

struct MenuScreen: View {
    
    @ObservedObject var viewModel = MenuScreenVM.instance
    @ObservedObject var loginVM = LoginScreenVM.instance
    
    var body: some View {
        NavigationView {
            List {
                ProfileListRowView(user: loginVM.currentUser ?? RECUser.placeholderUser)
                
                Section("My Contents") {
                    RECMenuListRow(rowItem: RECListRowItem(label: "Groups", iconStr: "\(CUPSystemIcon.person).2", tintColor: .accentColor))
                    RECMenuListRow(rowItem: RECListRowItem(label: "Social Awards", iconStr: "medal", tintColor: .cyan))
                    RECMenuListRow(rowItem: RECListRowItem(label: "Followers Donations", iconStr: "sparkles", tintColor: .purple))
                }
                
                Section("My Collections") {
                    HStack {
                        Spacer()
                        Text("You haven't created any collections.")
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                }
                
                Section("Application") {
                    NavigationLink(destination: AppSettingsScreen.init) {
                        RECMenuListRow(rowItem: viewModel.applicationSectionItems[0])
                    }
                    
                    RECMenuListRow(rowItem: RECListRowItem(label: "Support & Feedback", iconStr: "questionmark.bubble", tintColor: .secondary))
                    
                    RECMenuListRow(rowItem: RECListRowItem(label: "About Re:Connect", iconStr: "info.circle", tintColor: .secondary))
                }
            }
            .headerProminence(.increased)
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.newCollection)
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
