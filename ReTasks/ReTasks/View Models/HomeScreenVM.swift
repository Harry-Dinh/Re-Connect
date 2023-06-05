//
//  HomeScreenVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-06-03.
//

import Foundation

class HomeScreenVM: ObservableObject {
    static let viewModel = HomeScreenVM()
    
    @Published var presentSettingsScreen = false
    
    @Published var myLists: [RTListItem] = []
}
