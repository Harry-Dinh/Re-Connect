//
//  NewListVM.swift
//  ReTasks2
//
//  Created by Harry Dinh on 2023-08-15.
//

import Foundation
import SwiftUI

class NewListVM: ObservableObject {
    public static let viewModel = NewListVM()
    
    @Published var newList = RETList()
    @Published var listColorPicker = Color.accentColor
    @Published var listIcon = ""
}
