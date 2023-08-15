//
//  HomeVM.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation

class HomeVM: ObservableObject {
    public static let viewModel = HomeVM()
    
//    @Published var smartLists: [RETSmartList]
    @Published var myLists: [RETList] = []
    
    @Published var showNewListView = false
}
