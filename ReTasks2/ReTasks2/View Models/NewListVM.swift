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
    
    @ObservedObject private var homeVM = HomeVM.viewModel
    @ObservedObject private var encodingManager = EncodingManager.shared
    
    @Published var newList = RETList()
    @Published var listColorPicker = Color.accentColor
    @Published var listIcon = ""
    
    public func create(_ list: RETList) {
        encodingManager.listsIDs.append(list.id)
        homeVM.myLists.append(list)
        encodingManager.writeListIDsToUserDefaults(with: homeVM.myLists)
        encodingManager.bulkEncode(lists: homeVM.myLists)
    }
}
