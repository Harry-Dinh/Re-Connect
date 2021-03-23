//
//  ProfileVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-22.
//

import Foundation

class ProfileVM: ObservableObject {
    
    static let shared = ProfileVM()
    
    @Published var email: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
}
