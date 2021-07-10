//
//  ProfileVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-25.
//

import SwiftUI

class ProfileVM: ObservableObject {
    static let shared = ProfileVM()
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var pfpURL: String = ""
}
