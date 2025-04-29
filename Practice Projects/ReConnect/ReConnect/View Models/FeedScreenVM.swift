//
//  FeedScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-05-28.
//

import SwiftUI

class FeedScreenVM: ObservableObject {
    static let viewModel = FeedScreenVM()

    @Published var showPostCreationScreen = false
}
