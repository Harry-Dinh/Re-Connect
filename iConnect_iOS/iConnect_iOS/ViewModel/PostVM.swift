//
//  PostVM.swift
//  iConnect_iOS
//
//  Created by Harry Dinh on 2021-03-29.
//

import SwiftUI

class PostVM: ObservableObject {
    static let shared = PostVM()
    
    private init() {}
    
    @Published var postLiked: Bool = false
}
