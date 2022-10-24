//
//  ListDetailedView.swift
//  ReMinder
//
//  Created by Harry Dinh on 2022-10-21.
//

import SwiftUI

struct ListDetailedView: View {
    
    var listItem: ListItem
    
    var body: some View {
        List {
            
        }
        .navigationTitle("\(listItem.icon)  \(listItem.name)")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Circle())
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
    }
}

struct ListDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListDetailedView(listItem: ListItem.example)
        }
    }
}
