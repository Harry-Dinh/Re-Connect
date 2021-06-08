//
//  WelcomeScreenVM.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-06-08.
//

import SwiftUI

class WelcomeScreenVM: ObservableObject {
    static let shared = WelcomeScreenVM()
    
    @Published var title: String = "Welcome to iConnect!"
    @Published var subtitle: String = "You're all set! Tap \"Get Started\" to start using iConnect whenever you're ready."
    @AppStorage("is_signed_in") var isSignedIn = false
}
