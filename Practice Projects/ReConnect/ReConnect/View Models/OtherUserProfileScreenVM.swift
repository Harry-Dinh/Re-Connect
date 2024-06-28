//
//  OtherUserProfileScreenVM.swift
//  ReConnect
//
//  Created by Harry Dinh on 2024-06-25.
//

import Foundation
import SwiftUI

class OtherUserProfileScreenVM: ObservableObject {
    public static let vm = OtherUserProfileScreenVM()
    
    @Published var alreadyFollowed = false
    @Published var presentUnfollowActionSheet = false
}
