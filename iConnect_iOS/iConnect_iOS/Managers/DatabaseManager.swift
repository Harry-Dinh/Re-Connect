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
    
    private var database = Database.database().reference()
    
    public func test() {
        let object: [String: Any] = [
            "keyword": true,
            "dream": 1000,
            "name": "Harry Dinh"
        ]
        
        database.child("foo").setValue(object)
    }
}
