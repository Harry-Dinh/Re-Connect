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
    @Published var selectedTab: Int = 0
    
    public func unwrapUsernameFromStorage() -> String {
        if let first = UserDefaults.standard.string(forKey: "currentUserFirstName"),
           let last = UserDefaults.standard.string(forKey: "currentUserLastName") {
            self.firstName = first
            self.lastName = last
            
            return "\(firstName) \(lastName)"
        }
        else {
            return "Unnamed User"
        }
    }
}
