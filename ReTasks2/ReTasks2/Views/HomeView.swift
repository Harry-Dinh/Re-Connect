//
//  HomeView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeVM()
    @ObservedObject private var encodingManager = EncodingManager.shared
    
    var body: some View {
        NavigationView {
            List {
                // MARK: SMART LISTS
                Section {
                    ForEach(viewModel.smartLists, id: \.name) { smartList in
                        SmartListRowView(smartList: smartList)
                    }
                }
                
                // MARK: - USER'S LISTS
                Section("My Lists") {
                    ForEach(viewModel.myLists) { list in
                        RETListRowView(list: RETListWrapper(list))
                    }
                }
            }
            .navigationTitle("Re:Tasks")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("New List") {
                        viewModel.showNewListView.toggle()
                    }
                    
                    Button("New Task") {}
                }
            }
            .sheet(isPresented: $viewModel.showNewListView, content: NewListView.init)
            .refreshable {
                encodingManager.writeListIDsToUserDefaults(with: viewModel.myLists)
                encodingManager.bulkEncode(lists: viewModel.myLists)
                encodingManager.listsIDs.removeAll()
                viewModel.myLists.removeAll()
                encodingManager.listsIDs = encodingManager.readListsIDs()
                viewModel.myLists = encodingManager.bulkDecode(encodingManager.listsIDs)
                
                print(viewModel.myLists)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
