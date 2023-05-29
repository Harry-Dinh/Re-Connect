//
//  ProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import Foundation

class ProfileScreenVM: ObservableObject {
    static let viewModel = ProfileScreenVM()
    
    @Published var showEditProfileScreen = false
}
