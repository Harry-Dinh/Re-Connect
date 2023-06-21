//
//  ArticlesListView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import SwiftUI

struct ArticlesListView: View {
    
    var folder: ARTFolder
    
    var body: some View {
        List {
            
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {}) {
                    Image(systemName: CUPSystemIcon.filter)
                }
            }
        }
    }
}

struct ArticlesList_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(folder: ARTFolder.placeholder)
    }
}
