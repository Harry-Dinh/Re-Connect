//
//  RECNotificationWrapper.swift
//  ReConnect
//
//  Created by Harry Dinh on 2023-07-07.
//

import Foundation

/// The wrapper class for the object `RECNotification`. This class is used to make a `RECNotification` object conform to the `@ObservedObject` protocol when passing between SwiftUI views.
class RECNotificationWrapper: ObservableObject {
    @Published var notification: RECNotification
    
    init(_ notification: RECNotification) {
        self.notification = notification
    }
}
