//
//  HomeVM.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation

class HomeVM: ObservableObject {
    public static let viewModel = HomeVM()
    
    @Published var smartLists: [RETSmartList] = [
        RETSmartList(name: "Inbox", icon: "tray", color: .accentColor, items: []),
        RETSmartList(name: "Today", icon: "star", color: .yellow, items: []),
        RETSmartList(name: "Scheduled", icon: "calendar", color: .red, items: [])
    ]
    @Published var myLists: [RETList] = []
    
    @Published var showNewListView = false
}
