//
//  SearchScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-06-12.
//

import Foundation

class SearchScreenVM: ObservableObject {
    public static let viewModel = SearchScreenVM()
    
    @Published var searchQuery: String = ""
    
    @Published var listOfUsers: [RECUser] = []
}
