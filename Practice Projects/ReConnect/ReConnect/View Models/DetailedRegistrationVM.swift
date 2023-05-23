//
//  DetailedRegistrationVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-12.
//

import SwiftUI
import FirebaseDatabase

class DetailedRegistrationVM: ObservableObject {
    
    // MARK: - CLASS PROPERTIES
    
    static let viewModel = DetailedRegistrationVM()
    
    private let databaseReference = Database.database().reference()
    
    @ObservedObject private var loginVM = LoginScreenVM.viewModel
    
    // MARK: - STATES FOR SWIFTUI VIEWS
    
    /// Show when the function failed to convert the string age to an integer.
    @Published var failedToConvertAgeStr = false
    
    /// Show when an error occurred when trying to write the rest of the user's info to the database.
    @Published var failedToWriteToDatabase = false
    
    /// Show when an error occurred when trying to unwrap the user's UID.
    @Published var failedToUnwrapUID = false
    
    // MARK: - SWIFTUI VIEW PROPERTIES
    
    @Published var ageField: String = ""
    
    @Published var usernameField: String = ""
    
    @Published var protectedAccountToggle: Bool = true
    
    /// Update the child under the current user's UID with the following data. This method is called to finalized the account registration process.
    /// - Parameters:
    ///   - ageStr: The string value of the user's age
    ///   - username: The user's username
    ///   - isProtectedAccount: The user's preference for their account to be private or public
    public func updateFinalUserInfo(ageStr: String, username: String, isProtectedAccount: Bool) {
        guard let age = Int(ageStr) else {
            self.failedToConvertAgeStr = true
            return
        }
        
        loginVM.loggedInUser?.age = age
        loginVM.loggedInUser?.username = username
        loginVM.loggedInUser?.isProtectedAccount = isProtectedAccount
        
        let updatedData: [String: Any] = [
            "age": age,
            "username": username,
            "isProtectedAccount": isProtectedAccount
        ]
        
        guard let currentUserUID = loginVM.loggedInUser?.getUID() else {
            self.failedToUnwrapUID = true
            return
        }
        
        databaseReference.child("RECUsers").child(currentUserUID).updateChildValues(updatedData) { [weak self] error, _ in
            guard error == nil else {
                self?.failedToWriteToDatabase = true
                return
            }
            
            self?.loginVM.cacheLoggedInUser()
            self?.loginVM.isSignedIn = true
        }
    }
}
