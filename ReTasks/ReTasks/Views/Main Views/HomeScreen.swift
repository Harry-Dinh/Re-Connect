//
//  HomeScreen.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

struct HomeScreen: View {
    
    @ObservedObject private var viewModel = HomeScreenVM.viewModel
    
    var body: some View {
        NavigationStack {
            List {
                // Smart List section
                
                Section {
                    if !viewModel.myLists.isEmpty {
                        ForEach(viewModel.myLists) { list in
                            Text(list.name)
                        }
                    } else {
                        RTNoListAlert()
                    }
                } header: {
                    Text("My Lists")
                }
            }
            .headerProminence(.increased)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        viewModel.presentSettingsScreen.toggle()
                    }) {
                        Image(systemName: CUPSystemIcon.settings)
                    }
                    
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: {}) {
                            Label("New List...", systemImage: "plus.circle")
                        }
                        
                        Button(action: {}) {
                            Label("New Project...", systemImage: "plus.square")
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .searchable(text: .constant(""))
            .sheet(isPresented: $viewModel.presentSettingsScreen, content: SettingsScreen.init)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
