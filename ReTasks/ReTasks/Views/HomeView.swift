//
//  HomeView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-28.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeVM()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(viewModel.systemLists) { systemList in
                        NavigationLink(destination: SmartListDetailView(listWrapper: RETSystemListWrapper(systemList))) {
                            HomeSystemListRowView(listWrapper: RETSystemListWrapper(systemList))
                        }
                    }
                }
                
                Section("My Lists") {
                    if viewModel.userLists.isEmpty {
                        HStack {
                            Spacer()
                            Text(viewModel.NO_LISTS_ALERT)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .listRowBackground(Color.clear)
                    } else {
                        ForEach(viewModel.userLists) { list in
                            NavigationLink(destination: ListDetailView(listWrapper: RETListWrapper(list))) {
                                HomeListRowView(listWrapper: RETListWrapper(list))
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .destructive, action: {}) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {}) {
                        Label("New List", systemImage: "plus.square")
                            .labelStyle(.titleAndIcon)
                    }
                    
                    Button(action: {}) {
                        Label("New Task", systemImage: "plus.circle")
                            .labelStyle(.titleAndIcon)
                            .fontWeight(.bold)
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
