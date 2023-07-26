//
//  AuthManager.swift
//  ReChannels
//
//  Created by Harry Dinh on 2023-07-26.
//

import Foundation
import SwiftUI

class AuthenticationManager: ObservableObject {
    public static let shared = AuthenticationManager()
    
    @AppStorage("isSignedIn") var isSignedIn = false
}
