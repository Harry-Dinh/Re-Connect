//
//  EditProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-29.
//

import SwiftUI

class EditProfileScreenVM: ObservableObject {
    static let viewModel = EditProfileScreenVM()
    
    public var tempUser: RECUser = RECUser()
    
    @Published var selectedView = 0
    
    @Published var startingColor = Color.red
    @Published var endingColor = Color.blue
    @Published var tempEmailAddress = ""
}
