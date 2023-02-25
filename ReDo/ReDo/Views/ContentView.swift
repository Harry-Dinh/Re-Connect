//
//  ContentView.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contentVM = ContentVM.shared
    @ObservedObject var runtimeManager = RuntimeManager.shared
    @Environment(\.openWindow) var openWindow
    
    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            ListDetailView(list: runtimeManager.todayList)
        }
        .onAppear {
            print("on appear called")
            RuntimeManager.setCoreList()
            runtimeManager.setSelectedList(list: runtimeManager.todayList)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
