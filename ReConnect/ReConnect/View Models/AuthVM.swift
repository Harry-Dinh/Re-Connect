//
//  AuthVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2021-10-02.
//

import Foundation
import SwiftUI
import Firebase

class AuthVM: ObservableObject {
    
    static let shared = AuthVM()
    
    // MARK: - Database
    let databaseRef = Database.database().reference()
    
    public func test() {
        databaseRef.child("Test").setValue("foo, foo")
    }
}
