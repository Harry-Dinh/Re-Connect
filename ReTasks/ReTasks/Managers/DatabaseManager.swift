//
//  DatabaseManager.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-08-30.
//

import Foundation
import FirebaseDatabase
import SwiftUI

/// A manager class that handles everything that read and write from Firebase Database.
class DatabaseManager: ObservableObject {
    
    // MARK: REFERENCES
    
    public static let shared = DatabaseManager()
    private let databaseRef = Database.database().reference()
    
    @ObservedObject private var authManager = AuthManager.shared
    
    // MARK: - RETTASK ACTIONS
    
    /// Write the task data to the location of the specified list.
    /// - Parameters:
    ///   - task: The task object to write (after encoded)
    ///   - locationPath: The location path to the `items` key of the list.
    public func write(task: RETTask, to locationPath: DatabaseReference) {
        let taskData = RETTaskWrapper(task).encode()
        locationPath.updateChildValues(taskData)
    }
    
    // MARK: - RETLIST ACTIONS
    
    /// Write the list data to the right user node
    /// - Parameter list: The list to write the data to.
    public func write(list: RETList) {
        let firebaseUID = authManager.currentUser.firebaseUID
        let listData = RETListWrapper(list).encode()
        databaseRef.child(firebaseUID).updateChildValues(listData)
    }
    
    /// Write the system list data to the right user node
    /// - Parameter systemList: The system list to write the data to.
    public func write(systemList: RETSystemList) {
        let firebaseUID = authManager.currentUser.firebaseUID
        let systemListData = RETSystemListWrapper(systemList).encode()
        databaseRef.child(firebaseUID).updateChildValues(systemListData)
    }
}
