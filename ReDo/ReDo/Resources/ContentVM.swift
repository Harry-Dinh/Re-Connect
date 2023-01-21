//
//  ContentVM.swift
//  ReDo
//
//  Created by Harry Dinh on 2023-01-16.
//

import Foundation
import SwiftUI

class ContentVM: ObservableObject {
    public static let shared = ContentVM()
    
    @Published var newTaskAction = false
    @Published var newListAction = false
}
