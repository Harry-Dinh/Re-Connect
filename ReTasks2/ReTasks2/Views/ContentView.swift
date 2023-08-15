//
//  ContentView.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var encodingManager = EncodingManager.shared
    @ObservedObject private var homeVM = HomeVM.viewModel
    
    var body: some View {
        HomeView()
            .onAppear {
                encodingManager.listsIDs = encodingManager.readListsIDs()
                homeVM.myLists = encodingManager.bulkDecode(encodingManager.listsIDs)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
