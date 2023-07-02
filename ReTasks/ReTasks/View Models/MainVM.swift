//
//  MainVM.swift
//  ReTasks
//
//  Created by Harry Dinh on 2023-07-02.
//

import Foundation

class MainVM: ObservableObject {
    public static let viewModel = MainVM()
    
    @Published var inboxItem = RETList(name: "Inbox", icon: CUPSystemIcon.inboxTray)
}
