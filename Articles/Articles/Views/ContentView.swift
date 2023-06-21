//
//  ContentView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } content: {
            ArticlesListView(folder: ARTFolder.placeholder)
        } detail: {
            ArticleDetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
