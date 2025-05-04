//
//  FeedScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

class FeedScreenVM: ObservableObject {
    static let instance = FeedScreenVM()

    @Published var showPostCreationScreen = false

    @Published var currentUserFeed: [RECPost] = []
}
