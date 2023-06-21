//
//  ArticleDetailView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import SwiftUI

struct ArticleDetailView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.delete)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.archive)
                    }
                    
                    Button(action: {}) {
                        Image(systemName: CUPSystemIcon.share)
                    }
                }
            }
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView()
    }
}
