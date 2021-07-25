//
//  DiscoverVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-07-25.
//

import SwiftUI

class DiscoverVM: ObservableObject {
    static let shared = DiscoverVM()
    
    @Published var searchField: String = ""
}
