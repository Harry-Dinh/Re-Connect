//
//  SmartListDetailView.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import SwiftUI

struct SmartListDetailView: View {
    
    @ObservedObject var listWrapper: RETSystemListWrapper
    
    var body: some View {
        List {
            ForEach(listWrapper.systemList.items) { item in
                
            }
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(listWrapper.systemList.name)
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

struct SmartListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SmartListDetailView(listWrapper: RETSystemListWrapper(RETSystemList.placeholder))
        }
    }
}
