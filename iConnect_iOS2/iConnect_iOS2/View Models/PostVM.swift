//
//  PostVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-28.
//

import SwiftUI

class PostVM: ObservableObject {
    static let shared = PostVM()
    
    @Published var currentUserFirstName = ""
    @Published var currentUserLastName = ""
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
    
    public func unwrapUsername() {
        guard let firstName = UserDefaults.standard.string(forKey: "currentUserFirstName"),
              let lastName = UserDefaults.standard.string(forKey: "currentUserLastName") else {
            print("Cannot unwrap user name")
            return
        }
        
        self.currentUserFirstName = firstName
        self.currentUserLastName = lastName
        print("Successfully unwrapped username")
    }
}
