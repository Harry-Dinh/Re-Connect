//
//  RegisterScreenVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI
import FirebaseAuth

class RegisterScreenVM: ObservableObject {
    static let viewModel = RegisterScreenVM()
    static let loggedInUserID = "loggedInUserID"
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    @Published var failedToCreateAccountAlert = false
    
    @Published var emailField = ""
    @Published var passwordField = ""
    
    public func createAccount(with email: String, and password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let result = authResult, error == nil else {
                self?.failedToCreateAccountAlert.toggle()
                return
            }
            
            let uid = result.user.uid
            self?.cacheUserID(uid)
            self?.loginVM.isSignedIn = true
        }
    }
    
    public func cacheUserID(_ uid: String) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(uid)
        } catch {
            print("cannot cache user's uid")
        }
    }
}
