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
    @Published var username: String = ""
    @Published var pfpURL: String = ""
    @Published var selectedTab: Int = 0
    @Published var profileOnboarding: Bool = false
    
    public func unwrapUserInfoFromStorage() {
        if let first = UserDefaults.standard.string(forKey: "currentUserFirstName"),
           let last = UserDefaults.standard.string(forKey: "currentUserLastName"),
           let username = UserDefaults.standard.string(forKey: "currentUserUsername") {
            
            if first.isEmpty && last.isEmpty && username.isEmpty {
                self.firstName = "Unknown"
                self.lastName = "User"
                self.username = "No username set"
            }
            else {
                self.firstName = first
                self.lastName = last
                self.username = username
            }
        }
    }
}
