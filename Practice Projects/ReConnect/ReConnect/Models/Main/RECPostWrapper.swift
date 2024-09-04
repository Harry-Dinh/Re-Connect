//
//  RECPostWrapper.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-09-04.
//

import Foundation
import SwiftUI

/// Wrapper class for the `RECPost` object
class RECPostWrapper: ObservableObject {
    @Published var post: RECPost
    init(_ post: RECPost) { self.post = post }
}
