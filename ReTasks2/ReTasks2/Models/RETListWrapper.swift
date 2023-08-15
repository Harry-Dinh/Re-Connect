//
//  RETListWrapper.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation

class RETListWrapper: ObservableObject {
    @Published var list: RETList
    
    init(_ list: RETList) {
        self.list = list
    }
}
