//
//  FirestoreManager.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-08-17.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class FirestoreManager: ObservableObject {
    public static let shared = FirestoreManager()
    private let firestoreRef = Firestore.firestore()
    
    @ObservedObject private var registerVM = RegisterVM.viewModel
    @ObservedObject private var loginVM = LoginVM.viewModel
    
    // MARK: - READ/WRITE USER
    
    public func writeToFirestore(with user: RECUser) {
        
    }
}
