//
//  AuthVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-07-02.
//

import Foundation
import SwiftUI

class AuthVM: ObservableObject {
    public static let viewModel = AuthVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var loginEmail = ""
    @Published var loginPassword = ""
    
    @Published var presentRegisterScreen = false
}
