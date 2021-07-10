//
//  HomeVM.swift
//  iCList
//
//  Created by Harry Dinh on 2021-07-04.
//

import Foundation
import SwiftUI
import Firebase

class HomeVM: ObservableObject {
    static let shared = HomeVM()
    
    private let database = Database.database().reference()
    
    private let firestore = Firestore.firestore()
    
    public func testDatabase() {
        database.child("Test").setValue("foo")
    }
    
    public func testFirestore() {
        firestore.collection("Test").addDocument(data: ["Dream": "Gay"])
    }
}
