//
//  AuthVM.swift
//  Classroom
//
//  Created by Harry Dinh on 2023-04-19.
//

import Foundation
import SwiftUI
import FirebaseAuth

class AuthVM: ObservableObject {
    
    public static let shared = AuthVM()
    
    @AppStorage("isSignedIn") var isSignedIn = false
    
    @Published var showRegisterView = false
}
