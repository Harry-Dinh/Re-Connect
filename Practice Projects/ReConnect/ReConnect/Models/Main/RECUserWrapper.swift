//
//  RECUserWrapper.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-02.
//

import Foundation

/// The wrapper class for the object `RECUser`. This class is used to make a `RECUser` object conform to the `@ObservedObject` protocol when passing between SwiftUI views.
class RECUserWrapper: ObservableObject {
    @Published var user: RECUser
    
    init(_ user: RECUser) {
        self.user = user
    }
}
