//
//  ProfileSetupVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-25.
//

import SwiftUI

class ProfileSetupVM: ObservableObject {
    static let shared = ProfileSetupVM()
    
    @Published var pfpURL: String = ""
    
    public func writePfpURLToDatabase(url: String) {
        
    }
}
