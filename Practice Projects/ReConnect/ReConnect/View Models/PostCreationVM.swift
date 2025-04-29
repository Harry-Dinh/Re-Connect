//
//  PostCreationVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2025-04-28.
//

import SwiftUI

class PostCreationVM: ObservableObject {
    public static let instance = PostCreationVM()

    @Published var postContent: String = ""
}
