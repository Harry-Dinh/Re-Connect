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
    
    /// Upwrap the user's first name and last name from `UserDefaults` and return it to display in their profile.
    public func unwrappedCachedName() -> String {
        guard let firstName = UserDefaults.standard.string(forKey: "user_first_name"),
              let lastName = UserDefaults.standard.string(forKey: "user_last_name") else {
            print("Cannot unwrap cached names")
            return "Unknown User"
        }
        
        return "\(firstName) \(lastName)"
    }
    
    public func unwrapCachedEmail() -> String {
        guard let email = UserDefaults.standard.string(forKey: "user_profile_email") else {
            print("Cannot unwrap cached email")
            return "No email"
        }
        
        return email
    }
}
