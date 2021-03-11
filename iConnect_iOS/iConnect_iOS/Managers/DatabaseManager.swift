//
//  DatabaseManager.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-11.
//

import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    public func test() {
        database.child("foo").setValue(true)
    }
}
