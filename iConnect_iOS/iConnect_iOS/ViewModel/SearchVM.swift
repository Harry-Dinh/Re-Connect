//
//  SearchVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-04-10.
//

import SwiftUI

class SearchVM: ObservableObject {
    static let shared = SearchVM()
    
    @Published var searchFieldText = ""
    @Published var isEditing = false
}
