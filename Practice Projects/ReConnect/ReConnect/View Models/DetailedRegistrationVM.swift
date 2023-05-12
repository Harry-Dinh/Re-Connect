//
//  DetailedRegistrationVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-12.
//

import SwiftUI

class DetailedRegistrationVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = DetailedRegistrationVM()
    
    // MARK: - SWIFTUI VIEW PROPERTIES
    
    @Published var ageField: String = ""
    
    @Published var usernameField: String = ""
    
    @Published var protectedAccountToggle: Bool = true
}
