//
//  ContentView.swift
//  Articles
//
//  Created by Harry Dinh on 2023-06-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            FolderSidebar()
        } content: {
            Text("No Folder Selected")
                .font(.title2)
                .foregroundColor(.secondary)
        } detail: {
            Text("No Article Selected")
                .font(.title2)
                .foregroundColor(.secondary)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
