//
//  HomeVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-30.
//

import Foundation

class HomeVM: ObservableObject {
    static let shared = HomeVM()
    
    private init() {}
    
    @Published var showNewPostScreen: Bool = false
}
