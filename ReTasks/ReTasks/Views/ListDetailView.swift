//
//  SmartListDetailView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var listWrapper: RETListWrapper
    
    var body: some View {
        List {
            ForEach(listWrapper.list.items) { item in
                
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(listWrapper.list.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle")
                }
            }
            
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                
                Button(action: {}) {
                    Label("New Task", systemImage: "plus.circle")
                        .labelStyle(.titleAndIcon)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListDetailView(listWrapper: RETListWrapper(RETList.placeholder))
        }
    }
}
